//
//  FruitsList.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import SwiftUI

struct FruitsList: View {
    private var viewModel = FruitsListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.fruits) { fruit in
                NavigationLink(value: fruit) {
                    Text(fruit.name)
                        .font(.title3)
                }
                
            }
        }
        .navigationTitle("Fruits")
        .navigationDestination(for: Fruit.self) { fruit in
            FruitInfo(fruit: fruit)
        }
        .onAppear{
            Task { await viewModel.fetchFruits() }
        }
    }
}

#Preview {
    FruitsList()
}
