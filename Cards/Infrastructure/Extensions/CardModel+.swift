//
//  CardModel+.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

extension Array where Element == CardModel {
    func convertToCardViewModel() -> [CardViewModel] {
        return map { CardViewModel(cards: $0) }
    }
}

extension Array where Element == GroupCardModel {
    func favoritedGroupCardModel() -> [GroupCardModel] {
        return compactMap { groupItem in
            let isFavourit = groupItem.cards.reduce(false) {
                $0 || $1.isFavorite
            }
            if isFavourit {
                let cards = groupItem.cards.filter { $0.isFavorite }
                let newGroup = GroupCardModel(title: groupItem.title, cards: cards)
                return newGroup
            } else {
                return nil
            }
        }
    }
}
