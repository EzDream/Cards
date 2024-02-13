//
//  CardsApp.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import SwiftUI

@main
struct CardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
