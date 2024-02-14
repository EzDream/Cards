//
//  ContentView.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import CoreData
import SwiftUI

struct CardList: View {
    @StateObject var vm: CardListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(vm.cardsList) { groupCard in
                    Section {
                        ForEach(groupCard.cards) { card in
                            CardRow(card: card)
                                .listRowSeparator(.hidden)
                        }
                    } header: {
                        Text(groupCard.title.capitalized)
                            .bold()
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.red)

                    }
                }
            }
            .listStyle(.plain)
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
