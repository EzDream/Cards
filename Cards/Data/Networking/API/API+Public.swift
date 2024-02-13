//
//  API+Public.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

extension API {
    var cardList: URL? {
        api("api/v2/credit_cards?size=100")
    }
}

extension API {
    static var `default`: API {
        #if DEBUG
        return .dev
        #else
        return .prod
        #endif
    }
}
