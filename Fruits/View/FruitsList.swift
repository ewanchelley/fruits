//
//  FruitsList.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import SwiftUI

struct FruitsList: View {
    
    let fruits: [Fruit] = [
        Fruit(type: "Apple", price: 100, weight: 50),
        Fruit(type: "Banana", price: 200, weight: 100),
        Fruit(type: "Cherry", price: 300, weight: 150)
    ]
    
    var body: some View {
        List {
            ForEach(fruits) { fruit in
                NavigationLink(value: fruit) {
                    Text(fruit.type)
                        .font(.title3)
                }
            }
        }
        .navigationTitle("Fruits")
        .navigationDestination(for: Fruit.self) { fruit in
            FruitInfo(fruit: fruit)
        }
    }
}

#Preview {
    FruitsList()
}
