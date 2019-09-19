//
//  PopularViewModel.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/29/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation

protocol NetworkEngine {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    func performRequest(for url: URL, completionHandler: @escaping Handler)
}

extension URLSession: NetworkEngine {
    typealias Handler = NetworkEngine.Handler
    
    func performRequest(for url: URL, completionHandler: @escaping Handler) {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}

class PopularViewModel
{
    var results = Binder([Result]())
    var error: Binder<String>?
    var loading = Binder(false)
    
    let availableArrayRGB: [(Double, Double, Double)] = [
        (0, 0, 0),
        (1, 0, 0),
        (0, 1, 0),
        (0, 0, 1),
        (1, 1, 1)
    ]
    
    
    private let engine: NetworkEngine
    private let url: URL
    
    init(engine: NetworkEngine = URLSession.shared, url: String = Constants.url)
    {
        self.engine = engine
        self.url = URL(string: url)!
    }
    
    func loadResult() {
        self.loading.value = true
        engine.performRequest(for: url) { [weak self] (data, response, requestError) in
            
            self?.loading.value = false
            
            guard let data = data,
                let mostPopular = Coder().decode(toType: Popular.self, from: data),
                let results = mostPopular.results,
                requestError == nil else {
                self?.error?.value = requestError?.localizedDescription ?? "Some thing went wrong"
                return
            }
            
            self?.results.value = results
        }
    }
}













