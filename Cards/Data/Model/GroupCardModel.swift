//
//  GroupCardModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class GroupCardModel: Identifiable {
    var title: String = ""
    var cards: [CardViewModel] = []

    var id: String {
        return title
    }
    
    init(title: String, cards: [CardViewModel]) {
        self.title = title
        self.cards = cards
    }
}
