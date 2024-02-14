//
//  CardListViewModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class CardListViewModel: ObservableObject {
    @Published var cardsList: [GroupCardModel] = []
    @Published var loading: Bool = false
    @Published var errorMessage: String?

    var repo: CardListRepoProtocol

    init(repo: CardListRepoProtocol) {
        self.repo = repo
        Task {
            await fetchData()
        }
    }

    @MainActor
    func fetchData() async {
        do {
            loading = true
            let cards = try await repo.fetchCardList()
            loading = false
            cardsList = convertToGroup(cards: cards)
            errorMessage = nil
        } catch {
            loading = false
            errorMessage = error.localizedDescription
        }
    }

    private func convertToGroup(cards: [CardModel]) -> [GroupCardModel] {
        let groupedDictionary = Dictionary(grouping: cards) {
            $0.cardType
        }
        let cardTypes = groupedDictionary.keys.sorted()
        let groupedCardsList = cardTypes.compactMap { key in
            if let cards = groupedDictionary[key] {
                let cardViewModels = cards.map { CardViewModel(cards: $0) }
                return GroupCardModel(title: key, cards: cardViewModels)
            } else {
                return nil
            }
        }
        return groupedCardsList
    }
}
