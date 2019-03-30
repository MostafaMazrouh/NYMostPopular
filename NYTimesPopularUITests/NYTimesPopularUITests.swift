//
//  NYTimesPopularUITests.swift
//  NYTimesPopularUITests
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import XCTest

class NYTimesPopularUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let app = XCUIApplication()
        
        let tableView = app.tables["PopularTableView"]
        
        Thread.sleep(forTimeInterval: 3.0)
        
        XCTAssert(tableView.cells.count > 0, "No data")
        
        
        let cell = tableView.cells.containing(.cell, identifier: "0").element
        let titleLabelOut = cell.staticTexts["titleLabel"].label
        let authorLabelOut = cell.staticTexts["authorLabel"].label
        let dateLabelOut = cell.staticTexts["dateLabel"].label
        
        cell.tap()
        
        let titleLabelDetail = app.staticTexts["titleLabelDetail"].label
        let authorLabelDetail = app.staticTexts["authorLabelDetail"].label
        let dateLabelDetail = app.staticTexts["dateLabelDetail"].label
        
        XCTAssert(titleLabelOut == titleLabelDetail, "Wrong match")
        XCTAssert(authorLabelOut == authorLabelDetail, "Wrong match")
        XCTAssert(dateLabelOut == dateLabelDetail, "Wrong match")
    }

}
