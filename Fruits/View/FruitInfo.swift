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
            Text("Price: \(fruit.price)")
            Text("Weight: \(fruit.weight)")
            Spacer()
        }
        .font(.title2)
        .navigationTitle(fruit.type)
    }
}

#Preview {
    FruitInfo(fruit: Fruit(type: "Apple", price: 100, weight: 50))
}
