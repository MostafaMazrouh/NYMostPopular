//
//  DetailsViewModelTests.swift
//  NYTimesPopularTests
//
//  Created by Mostafa on 9/19/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import XCTest
@testable import NYTimesPopular

class DetailsViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGenerateRandomNumber() {
        let detailsViewModel = DetailsViewModel()
        
        let randomNumber = detailsViewModel.generateRandomNumber(maxNumber: 12)
        
        XCTAssert(randomNumber < 13, "Large Random Number")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
