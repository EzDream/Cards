//
//  MockCards.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

class MockCards {
    static var card: CardModel {
        return cardList.first!
    }

    static var cardList: [CardModel] {
        guard let path = Bundle.main.url(forResource: "Cards", withExtension: "json") else {
            fatalError("Not found Cards.jso")
        }
        guard let data = try? Data(contentsOf: path) else {
            fatalError("Invalid Data")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let list = try? decoder.decode([CardModel].self, from: data) else {
            fatalError("Invalid data")
        }
        return list
    }
}
