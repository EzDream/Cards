//
//  CardRow.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import SwiftUI

struct CardRow: View {
    var card: CardModel
    var body: some View {
        ZStack {
            Text(card.creditCardNumber ?? "")
                .bold()
                .font(.system(.title, design: .rounded))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 180)
        .overlay(alignment: .bottomLeading, content: {
            HStack(spacing: 5) {
                Text("Expires:")
                    .font(.footnote)
                    .foregroundColor(.primary.opacity(0.5))
                Text(card.creditCardExpiryDate ?? "")
                    .font(.footnote)
                    .bold()
            }
        })
        .overlay(alignment: .top, content: {
            HStack {
                Spacer()
                Text(card.creditCardType ?? "")
                    .bold()
                    .font(.system(.largeTitle, design: .serif))
            }
        })
        .padding(25)
        .background(.background)
        .cornerRadius(20)
        .padding()
        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    CardRow(card: MockCards.card)
}
