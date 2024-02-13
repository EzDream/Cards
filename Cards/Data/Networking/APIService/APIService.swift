//
//  APIService.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

class APIService: APIServiceProtocol {
    var api: APIProtocol
    var client: HTTPClientProtocol

    init(api: APIProtocol, client: HTTPClientProtocol) {
        self.api = api
        self.client = client
    }

    func fetchCardList() async throws -> [CardModel] {
        return []
    }
}
