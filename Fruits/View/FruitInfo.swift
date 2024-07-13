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
        VStack(alignment: .leading) {
            Text("Price: \(fruit.formattedPrice)")
            Text("Weight: \(fruit.formattedWeight)")
            Spacer()
        }
        .font(.title2)
        .navigationTitle(fruit.name)
    }
}

#Preview {
    FruitInfo(fruit: Fruit(name: "Apple", price: 1.00, weight: 50))
}
