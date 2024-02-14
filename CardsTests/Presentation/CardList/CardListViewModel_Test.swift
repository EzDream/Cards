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

    func test_CardListViewModel_ErrorMessageShouldBeNil() async throws {
        await vm.fetchData()
        XCTAssertNil(vm.errorMessage)
    }

    func test_CardListViewModel_GroupedArray() async throws {
        await vm.fetchData()
        let groupedCardList = vm.cardsList
        if groupedCardList.count > 2 {
            let firstCard = groupedCardList[0]
            let nextRandomCard = Array(groupedCardList.dropFirst()).randomElement()!
            XCTAssertTrue(firstCard.title < nextRandomCard.title)
        }
    }
}
