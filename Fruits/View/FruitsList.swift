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
                        .foregroundStyle(.black)
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
        .scrollContentBackground(.hidden)
        .background(FruitsBackground())
        .navigationTitle("Fruits")
        .navigationDestination(for: Fruit.self) { fruit in
            FruitInfo(fruit: fruit)
        }
        .onAppear {
            if viewModel.fruits.isEmpty {
                Task { await viewModel.fetchFruits() }
            }
        }
        .refreshable {
            await viewModel.fetchFruits()
        }
    }
}

#Preview {
    FruitsList()
}
