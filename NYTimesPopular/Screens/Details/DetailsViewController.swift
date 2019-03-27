//
//  DetailsViewController.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var result: Result?
    
    let viewModel = MostPopularViewModel()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        setUp()
        
        getImage()
    }
    
    func setUp()
    {
        title = "Details"
        
        guard let result = result else {
            navigationController?.popViewController(animated: true)
            return }
        
        titleLabel.text = result.title
        authorLabel.text = result.byline
        dateLabel.text = result.published_date
        
        detailsLabel.text = result.abstract
    }
    
    func getImage()
    {
        guard let result = result else {
            navigationController?.popViewController(animated: true)
            return }
        
        viewModel.getBigImage(result: result) { [weak self] (image) in
            
            DispatchQueue.main.async {
                self?.bigImage.image = image
                self?.view.layoutIfNeeded()
            }
        }
    }

}
