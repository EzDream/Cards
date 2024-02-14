//
//  CardListViewModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

enum FilterType {
    case all
    case favourite
}

enum CardListEvent {
    case onFilter(type: FilterType)
}

class CardListViewModel: ObservableObject {
    @Published var cardsList: [GroupCardModel] = []
    @Published var loading: Bool = false
    @Published var errorMessage: String?

    var allCardList: [GroupCardModel] = []

    var repo: CardListRepoProtocol

    init(repo: CardListRepoProtocol) {
        self.repo = repo
        Task {
            await fetchData()
        }
    }

    func onEvent(event: CardListEvent) {
        switch event {
        case .onFilter(let type):
            filterEvent(type: type)
        }
    }

    private func filterEvent(type: FilterType) {
        switch type {
        case .all:
            showAllList()
            break
        case .favourite:
            showFilteredList()
            break
        }
    }

    private func showAllList() {
        cardsList = allCardList
    }

    private func showFilteredList() {
        cardsList = allCardList.favoritedGroupCardModel()
    }

    @MainActor
    public func fetchData() async {
        do {
            loading = true
            let cards = try await repo.fetchCardList()
            loading = false
            cardsList = convertToGroup(cards: cards)
            allCardList = cardsList
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
                let cardViewModels = cards.convertToCardViewModel()
                return GroupCardModel(title: key, cards: cardViewModels)
            } else {
                return nil
            }
        }
        return groupedCardsList
    }
}
