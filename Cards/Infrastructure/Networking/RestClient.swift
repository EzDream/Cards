//
//  RestClient.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}


class RestClient: HTTPClientProtocol {
    private var session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession(configuration: .default)) {
        self.session = session
    }

    func apiRequest(_ request: URLRequest) async throws -> Data {
        let (data, response) = try await session.data(for: request)
        guard let res = response as? HTTPURLResponse,
              res.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
