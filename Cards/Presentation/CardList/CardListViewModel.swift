//
//  CardListViewModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class CardListViewModel: ObservableObject {
    @Published var cards: [CardModel] = []
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
            self.cards = cards
        } catch {
            loading = false
            errorMessage = NSLocalizedString("An error occurred", comment: "") + " \(error.localizedDescription)"
        }
    }
}
