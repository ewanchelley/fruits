//
//  FruitNameButton.swift
//  Fruits
//
//  Created by Ewan Chelley on 20/07/2024.
//

import SwiftUI

struct FruitNameButton: View {
    let fruitName: String
    let onPressButton: (() -> Void)
    var body: some View {
        Button(action: onPressButton) {
            HStack{
                Text(fruitName)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.gray)
            }
            .font(.title3)
            .padding(8)
        }
        .listRowSeparator(.hidden)
        .listRowBackground (
            RoundedRectangle(cornerRadius: UIConstants.contentBackgroundCornerRadius)
                .fill(UIConstants.contentBackgroundColor)
                .padding(3)
        )
    }
}

#Preview {
    FruitNameButton(fruitName: "Kiwi") {}
}
