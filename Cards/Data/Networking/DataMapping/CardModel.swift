//
//  CardModel.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

// {
// id: 6307,
// uid: "29c0cd85-195a-4dd3-986f-a85dd6e95fb2",
// credit_card_number: "1228-1221-1221-1431",
// credit_card_expiry_date: "2028-02-12",
// credit_card_type: "laser"
// }

struct CardModel: Identifiable, Decodable {
    let id: Int
    let uid: String
    let creditCardNumber: String?
    let creditCardExpiryDate: String?
    let creditCardType: String?
}

extension CardModel: Equatable {
    static func == (lhs: CardModel, rhs: CardModel) -> Bool {
        return lhs.id == rhs.id
    }
}
