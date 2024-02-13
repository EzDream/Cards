//
//  MockURLSession.swift
//  CardsTests
//
//  Created by Tesla on 14/02/24.
//

@testable import Cards
import Foundation

class MockURLSession: URLSessionProtocol {
    let urlResponse = HTTPURLResponse(url: URL(string: "https://www.google.com")!,
                                      statusCode: 404, // 非200状态码
                                      httpVersion: nil,
                                      headerFields: nil)!

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return (Data(), urlResponse)
    }
}
