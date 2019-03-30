//
//  CoderTests.swift
//  NYTimesPopularTests
//
//  Created by Mostafa on 3/29/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import XCTest
@testable import NYTimesPopular

class CoderTests: XCTestCase {

    var coder: Coder!
    var bundel: Bundle!
    
    override func setUp() {
        coder = Coder()
        bundel = Bundle(for: CoderTests.self)
    }

    override func tearDown() {
        coder = nil
        bundel = nil
    }
    
    func testDacode()
    {
        if let path = bundel.path(forResource: "NYTimesPopular", ofType: "json")
        {
            do
            {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let mostPopular = coder.decode(toType: Popular.self, from: data)
                
                XCTAssert(mostPopular?.num_results == 1697, "Wrong num_results")
                XCTAssert(mostPopular?.results?.count == 20, "Wrong num_results")
                XCTAssert(mostPopular?.results?[0].title == "At 71, She’s Never Felt Pain or Anxiety. Now Scientists Know Why.",
                          "Wrong title")
                XCTAssert(mostPopular?.results?[0].published_date == "2019-03-28",
                          "Wrong published_date")
            }
            catch {
                XCTFail("Can't read NYTimesPopular.json")
            }
        } else {
            XCTFail("Can't get path to NYTimesPopular.json")
        }
        
    }
}
