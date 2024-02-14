//
//  CardRow.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import SwiftUI

struct CardRow: View {
    @ObservedObject var card: CardViewModel

    var bookmark: String {
        return card.isFavorite == true ? "heart.fill" : "heart"
    }

    var body: some View {
        ZStack {
            Text(card.model.cardNumber)
                .bold()
                .font(.system(.title, design: .rounded))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .overlay(alignment: .bottomLeading, content: {
            HStack(spacing: 5) {
                Text("Expires:")
                    .font(.footnote)
                    .foregroundColor(.primary.opacity(0.5))
                Text(card.model.cardExpiryDate)
                    .font(.footnote)
                    .bold()
            }
        })
        .overlay(alignment: .top, content: {
            HStack {
                Button {
                    card.isFavorite.toggle()
                } label: {
                    Image(systemName: bookmark)
                        .font(.system(size: 20))
                }
                .background(.red)

                Spacer()
                Text(card.model.cardType.capitalized)
                    .bold()
                    .font(.system(.headline, design: .monospaced))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        })
        .padding(25)
        .background(.background)
        .cornerRadius(20)
        .padding(.vertical, 15)
        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    CardRow(card: CardViewModel(cards: MockCards.card))
}
