//
//  APIService.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

class APIService: APIServiceProtocol {
    var api: API
    var client: HTTPClientProtocol

    init(api: API, client: HTTPClientProtocol) {
        self.api = api
        self.client = client
    }

    func fetchCardList() async throws -> [CardModel] {
        guard let url = api.cardList else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        let cards = try await fetch(for: [CardModel].self, request: request)
        return cards
    }

    private func fetch<T: Decodable>(
        for: T.Type,
        request: URLRequest,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    ) async throws -> T {
        let responseData = try await client.apiRequest(request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        let model = try decoder.decode(T.self, from: responseData)
        return model
    }

    enum HTTPMethod: String {
        case get = "GET"
    }
}
