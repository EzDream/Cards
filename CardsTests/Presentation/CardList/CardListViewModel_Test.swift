//
//  CardListViewModel_Test.swift
//  CardsTests
//
//  Created by Tesla on 14/02/24.
//

@testable import Cards
import XCTest

final class CardListViewModel_Test: XCTestCase {
    var vm: CardListViewModel!

    override func setUpWithError() throws {
        let apiService = APIService(api: API.default, client: RestClient())
        let repo = CardListRepoProvider(apiService: apiService)
        vm = CardListViewModel(repo: repo)
    }

    override func tearDownWithError() throws {
        vm = nil
    }

    func test_CardListViewModel_ShouldHaveCards() throws {
        sleep(5)
        XCTAssertNotEqual(vm.cards.count, 0)
    }
}
