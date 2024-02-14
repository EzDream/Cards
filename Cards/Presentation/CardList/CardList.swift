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
            .navigationTitle("Cards")
            .navigationBarTitleDisplayMode(.inline)
            .overlay(content: {
                loadingView()
            })
            .toolbar {
                toobarView()
            }
        }
    }
}

private extension CardList {
    @ViewBuilder
    private func loadingView() -> some View {
        if vm.loading {
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(1.5)
                .tint(.red)
        }
    }

    private func toobarView() -> some ToolbarContent {
        return ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
                Button {} label: {
                    Label("All", systemImage: "text.justify")
                }

                Button {} label: {
                    Label("Favorites", systemImage: "heart")
                }
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            .tint(.red)
        }
    }
}

#Preview {
    CardList(vm: DIManager.shared.resolve(CardListViewModel.self)!)
}
