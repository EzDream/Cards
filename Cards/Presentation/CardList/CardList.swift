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
                        sectionTitle(title: groupCard.title)
                    }
                }
            }
            .environmentObject(vm)
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
    private func sectionTitle(title:String) -> some View {
        Text(title.capitalized)
            .bold()
            .font(.system(.title, design: .rounded))
            .foregroundColor(.red)
    }

    @ViewBuilder
    private func loadingView() -> some View {
        ZStack {
            if vm.loading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.5)
                    .tint(.red)
            }
            if let error = vm.errorMessage {
                VStack(spacing: 15) {
                    Label(error, systemImage: "wifi.slash")
                        .foregroundColor(.primary.opacity(0.5))
                    Button(action: {
                        Task {
                            await vm.fetchData()
                        }
                    }, label: {
                        Label("Try again", systemImage: "arrow.circlepath")
                            .foregroundColor(.red)
                    })
                }
                .padding(.horizontal, 5)
            }
        }
    }

    private func toobarView() -> some ToolbarContent {
        return ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
                Button {
                    vm.onEvent(event: .onFilter(type: .all))
                } label: {
                    Label("All", systemImage: "text.justify")
                }

                Button {
                    vm.onEvent(event: .onFilter(type: .favourite))
                } label: {
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
