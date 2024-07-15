//
//  FruitInfo.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import SwiftUI

struct FruitInfo: View {
    let fruit: Fruit
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(fruit.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                Divider()
                FruitInfoRow(
                    iconName: "sterlingsign.circle.fill",
                    label: "Price",
                    value: fruit.formattedPrice,
                    color: .blue
                )
                FruitInfoRow(
                    iconName: "scalemass.fill",
                    label: "Weight",
                    value: fruit.formattedWeight,
                    color: .orange
                )
            }
            .padding()
            .background(UIConstants.contentBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: UIConstants.contentBackgroundCornerRadius))
            .padding(.horizontal, 40)
            Spacer()
        }
        .background(FruitsBackground())
    }
}

#Preview {
    FruitInfo(fruit: Fruit(name: "Apple", price: 1.00, weight: 0.3))
}
