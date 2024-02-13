//
//  CardListViewModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class CardListViewModel: ObservableObject {
    @Published var cards: [CardList] = []

    var repo: CardListRepoProtocol

    init(repo: CardListRepoProtocol) {
        self.repo = repo
    }
}
