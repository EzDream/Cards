//
//  API_Tests.swift
//  CardsTests
//
//  Created by Tesla on 13/02/24.
//

@testable import Cards
import XCTest

final class API_Tests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_API_dev() throws {
        let expectedURL = "https://random-data-api.com/api/v2/credit_cards?size=100"
        let cardlistAPI = API.dev.cardList
        XCTAssertNotNil(cardlistAPI)
        XCTAssertEqual(cardlistAPI!.absoluteString, expectedURL)
    }

    func test_API_prod() throws {
        let expectedURL = "https://random-data-api.com/api/v2/credit_cards?size=100"
        let cardlistAPI = API.prod.cardList
        XCTAssertNotNil(cardlistAPI)
        XCTAssertEqual(cardlistAPI!.absoluteString, expectedURL)
    }
}
