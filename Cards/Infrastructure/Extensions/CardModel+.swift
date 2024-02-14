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
        compactMap { groupedCardModel in
            let existingFavourit = groupedCardModel.cards.reduce(false) {
                $0 || $1.isFavorite
            }
            if existingFavourit {
                let cards = groupedCardModel.cards.filter { $0.isFavorite }
                let newGroupCardModel = GroupCardModel(title: groupedCardModel.title, cards: cards)
                return newGroupCardModel
            } else {
                return nil
            }
        }
    }
}
