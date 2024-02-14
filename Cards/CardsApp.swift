//
//  CardsApp.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import SwiftUI

@main
struct CardsApp: App {
    var body: some Scene {
        WindowGroup {
            CardList(vm: DIManager.shared.resolve(CardListViewModel.self)!)
        }
    }
}
