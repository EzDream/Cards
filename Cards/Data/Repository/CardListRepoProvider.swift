//
//  CardListRepoProvider.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class CardListRepoProvider: CardListRepoProtocol {
    var apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchCardList() async throws -> [CardModel] {
        let cards = try await self.apiService.fetchCardList()
        return cards
    }
}
