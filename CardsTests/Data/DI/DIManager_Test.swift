//
//  DIManager_Test.swift
//  CardsTests
//
//  Created by Tesla on 14/02/24.
//

@testable import Cards
import XCTest

final class DIManager_Test: XCTestCase {
    func test_api_di_shouldNotBeNil() {
        let api = DIManager.shared.resolve(API.self)
        XCTAssertNotNil(api)
    }
    
    func test_client_di_shouldNotBeNil() {
        let client = DIManager.shared.resolve(HTTPClientProtocol.self)
        XCTAssertNotNil(client)
    }
    
    func test_apiService_di_shouldNotBeNil() {
        let apiService = DIManager.shared.resolve(APIServiceProtocol.self)
        XCTAssertNotNil(apiService)
    }
    
    func test_CardRepo_di_shouldNotBeNil() {
        let repo = DIManager.shared.resolve(CardListRepoProtocol.self)
        XCTAssertNotNil(repo)
    }
    
    func test_CardListViewModel_di_shouldNotBeNil() {
        let vm = DIManager.shared.resolve(CardListViewModel.self)
        XCTAssertNotNil(vm)
    }
}
