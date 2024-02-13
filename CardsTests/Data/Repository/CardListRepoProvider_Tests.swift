//
//  CardListRepoProvider_Tests.swift
//  CardsTests
//
//  Created by Tesla on 14/02/24.
//

@testable import Cards
import XCTest

final class CardListRepoProvider_Tests: XCTestCase {
    var repo: CardListRepoProvider!

    override func setUpWithError() throws {
        let apiService = APIService(api: API.default, client: RestClient())
        repo = CardListRepoProvider(apiService: apiService)
    }

    override func tearDownWithError() throws {
        repo = nil
    }

    func test_CardListRepoProvider_CardsShouldHaveList() async throws {
        do {
            _ = try await repo.fetchCardList()
        } catch {
            XCTFail("test_CardListRepoProvider_CardsShouldHaveList: Error: \(error.localizedDescription)")
        }
    }
}
