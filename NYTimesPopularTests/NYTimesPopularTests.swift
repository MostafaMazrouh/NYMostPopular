//
//  NYTimesPopularTests.swift
//  NYTimesPopularTests
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import XCTest
@testable import NYTimesPopular

class NYTimesPopularTests: XCTestCase
{
    func testLoadResult()
    {
        class NetworkEngineMock: NetworkEngine {
            typealias Handler = NetworkEngine.Handler
            
            var requestedURL: URL?
            
            func performRequest(for url: URL, completionHandler: @escaping Handler) {
                requestedURL = url
                
                let bundel = Bundle(for: CoderTests.self)
                
                if let path = bundel.path(forResource: "NYTimesPopular", ofType: "json")
                {
                    do
                    {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                        
                        completionHandler(data, nil, nil)
                    } catch {
                        XCTFail("Can't read NYTimesPopular.json")
                    }
                } else {
                    XCTFail("Can't get path to NYTimesPopular.json")
                }
            }
        }
        
        let engine = NetworkEngineMock()
        
        
        let viewModel = PopularViewModel(engine: engine, url: Constants.urlTest)
        
        viewModel.loadResult()
        
        guard let vmResults = viewModel.results.value else {
            XCTFail("Enpty Result")
            return
        }
        
        XCTAssert(vmResults.count == 20, "Wrong count number")
        
        XCTAssert(vmResults[0].title == "At 71, She’s Never Felt Pain or Anxiety. Now Scientists Know Why.",
                  "Wrong title")
        XCTAssert(vmResults[0].published_date == "2019-03-28",
                  "Wrong published_date")
    }
}



