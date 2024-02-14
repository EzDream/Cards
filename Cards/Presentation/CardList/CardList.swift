//
//  ContentView.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import CoreData
import SwiftUI

struct CardList: View {
    var vm: CardListViewModel

    var body: some View {
        NavigationView {
            List {
              
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    CardList(vm: DIManager.shared.resolve(CardListViewModel.self)!)
}
