//
//  MostPopularViewModel.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
//import AlamofireImage

protocol MostPopularProtocol: class {
    func reloadAllCells()
    func reloadCell(indexPath: IndexPath)
}

class MostPopularViewModel
{
    var results = [Result]()
    var popularImages = [Int: UIImage]()
    
    weak var viewController: MostPopularProtocol?
    
    func getMostPopular(handler: @escaping (Bool, String?)->())
    {
        let url = Constants.url
        
        Alamofire.request(url).responseData { [weak self] (dataResponse) in
            
            guard dataResponse.result.isSuccess,
                dataResponse.response?.statusCode == 200,
                let data = dataResponse.data,
                let mostPopular = Coder().decode(toType: MostPopular.self, from: data),
                let results = mostPopular.results
                else
            { return handler(false, Constants.errorMessage) }
            
            self?.results = results
            self?.viewController?.reloadAllCells()
            return handler(true, nil)
        }
    }
    
    func loadMostPopularImage(result: Result, indexPath: IndexPath)
    {
        guard let id = result.id,
            let url = result.media?[0].mediaMetadata?[0].url
            else { return }
        
        Alamofire.request(url).responseData { [capturedId = id, weak self] response in
            
            guard let data = response.data,
                let image = UIImage(data: data) else { return }
            
            self?.popularImages[capturedId] = image
            self?.viewController?.reloadCell(indexPath: indexPath)
        }
    }
    
    func getBigImage(result: Result, handler: @escaping (UIImage?)->())
    {
        guard let media = result.media,
            media.count > 0,
            let mediaMetadata = media[0].mediaMetadata,
            mediaMetadata.count > 2,
            let url = mediaMetadata[2].url
            else { return }
        
        Alamofire.request(url).responseData { response in
            
            guard let data = response.data,
                let image = UIImage(data: data) else {
                    handler(nil)
                    return
            }
            handler(image)
        }
    }
}
