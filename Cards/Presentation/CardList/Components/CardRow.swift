//
//  CardRow.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import SwiftUI

struct CardRow: View {
    @ObservedObject var card: CardViewModel

    @EnvironmentObject var CardListVM: CardListViewModel

    var body: some View {
        ZStack(alignment: .center) {
            accountView()
            cardTypeView()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .overlay(alignment: .bottomLeading, content: {
            expireView()
        })
        .padding(25)
        .background(.background)
        .cornerRadius(20)
        .padding(.vertical, 15)
        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

extension CardRow {
    private var bookmark: String {
        return card.isFavorite == true ? "heart.fill" : "heart"
    }

    private var bookmarkColor: Color {
        card.isFavorite ? .red : .primary.opacity(0.5)
    }

    private func accountView() -> some View {
        Text(card.model.cardNumber)
            .bold()
            .font(.system(.title, design: .rounded))
            .lineLimit(1)
            .minimumScaleFactor(0.7)
    }

    private func expireView() -> some View {
        HStack(spacing: 5) {
            Text("Expires:")
                .font(.footnote)
                .foregroundColor(.primary.opacity(0.5))
            Text(card.model.cardExpiryDate)
                .font(.footnote)
                .bold()
        }
    }

    private func cardTypeView() -> some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        card.isFavorite.toggle()
                        if card.isFavorite == false && CardListVM.currentMode == .favourite {
                            CardListVM.onEvent(event: .onFilter(type: .favourite))
                        }
                    }
                } label: {
                    Image(systemName: bookmark)
                        .font(.system(size: 23))
                        .foregroundColor(
                            bookmarkColor
                        )
                }
                .buttonStyle(.plain)
                Spacer()
                Text(card.model.cardType.capitalized)
                    .bold()
                    .font(.system(.headline, design: .monospaced))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            Spacer()
        }
    }
}

#Preview {
    CardRow(card: CardViewModel(cards: MockCards.card))
}
