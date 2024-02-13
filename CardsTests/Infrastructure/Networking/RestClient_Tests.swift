//
//  RestClient_Tests.swift
//  CardsTests
//
//  Created by Tesla on 14/02/24.
//

@testable import Cards
import XCTest

final class RestClient_Tests: XCTestCase {
    var restClient: RestClient!

    override func setUpWithError() throws {
        restClient = RestClient()
    }

    override func tearDownWithError() throws {
        restClient = nil
    }

    func test_ResetClient_dev_shouldHaveData() async throws {
        let api = try XCTUnwrap(API.dev.cardList)
        let request = URLRequest(url: api)
        do {
            _ = try await restClient.apiRequest(request)
        } catch {
            XCTFail("test_ResetClient_dev_shouldHaveData error: \(error.localizedDescription)")
        }
    }

    func test_ResetClient_pro_shouldHaveData() async throws {
        let api = try XCTUnwrap(API.prod.cardList)
        let request = URLRequest(url: api)
        do {
            _ = try await restClient.apiRequest(request)
        } catch {
            XCTFail("test_ResetClient_prod_shouldHaveData error: \(error.localizedDescription)")
        }
    }
}
