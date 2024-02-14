//
//  GroupCardModel.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

struct GroupCardModel: Identifiable {
    var title: String
    var cards: [CardModel]

    var id: String {
        return title
    }
}
