//
//  HTTPClientProtocol.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

protocol HTTPClientProtocol {
    func apiRequest(_ request: URLRequest) async throws -> Data
}
