//
//  CardsUITests.swift
//  CardsUITests
//
//  Created by Tesla on 13/02/24.
//

import XCTest

final class CardsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func test_navbar_shoudBe_AllCards() throws {
        let navBar = app.navigationBars["All Cards"]
        XCTAssertTrue(navBar.exists)
    }
    
    func test_navbar_shoudBe_FavoriteCards() throws {
        let navBar = app.navigationBars["All Cards"]
        XCTAssertTrue(navBar.exists)
    }
}
