//
//  MockCards_Test.swift
//  CardsTests
//
//  Created by Tesla on 14/02/24.
//

@testable import Cards
import XCTest

final class MockCards_Test: XCTestCase {
    func test_MockCard_cardList_shouldNotEmpty() {
        XCTAssertNotEqual(MockCards.cardList.count, 0)
    }

    func test_MockCard_card_shouldNotEmpty() {
        XCTAssertEqual(MockCards.card, MockCards.cardList.first)
    }
}
