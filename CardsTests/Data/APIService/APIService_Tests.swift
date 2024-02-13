//
//  APIService_Tests.swift
//  CardsTests
//
//  Created by Tesla on 13/02/24.
//

@testable import Cards
import XCTest

final class APIService_Tests: XCTestCase {
    var apiService: APIService!

    override func setUpWithError() throws {
        apiService = APIService(api: API.dev, client: RestClient())
    }

    override func tearDownWithError() throws {
        apiService = nil
    }

    func test_APIService_fetchData_shouldHaveData() async throws {
        let cards = try await apiService.fetchCardList()
        XCTAssertNotEqual(cards.count, 0)
    }
}
