//
//  APIServiceProtocol.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchCardList() async throws -> [CardModel]
}
