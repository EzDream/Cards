//
//  CardRow.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import SwiftUI

struct CardRow: View {
    var card: CardModel

    var bookmark: String {
        return card.bookmark == true ? "heart.fill" : "heart"
    }

    var body: some View {
        ZStack {
            Text(card.cardNumber)
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
                Text(card.cardExpiryDate)
                    .font(.footnote)
                    .bold()
            }
        })
        .overlay(alignment: .top, content: {
            HStack {
                Button {
                    card.bookmark?.toggle()
                } label: {
                    Image(systemName: bookmark)
                        .font(.system(size: 20))
                }

                Spacer()
                Text(card.cardType.capitalized)
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
    CardRow(card: MockCards.card)
}
