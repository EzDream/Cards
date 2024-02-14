//
//  CardViewModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class CardViewModel: ObservableObject, Identifiable {
    @Published var model: CardModel
    @Published var isFavorite: Bool = false
    
    var id: Int {
        return model.id
    }

    init(cards: CardModel) {
        self.model = cards
    }
}
