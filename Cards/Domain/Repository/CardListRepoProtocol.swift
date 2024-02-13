//
//  CardListRepoProtocol.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation

protocol CardListRepoProtocol {
    func fetchCardList() async throws -> [CardModel]
}
