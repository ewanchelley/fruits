//
//  FruitsList.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import SwiftUI

struct FruitsList: View {
    @EnvironmentObject var navigation: NavigationViewModel
    let viewModel: FruitsListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.fruits) { fruit in
                FruitNameButton(
                    fruitName: fruit.name,
                    onPressButton: { navigation.navigateTo(fruit) }
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
            Task {
                await navigation.viewLoaded()
            }
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
    FruitsList(viewModel: FruitsListViewModel())
        .environmentObject(NavigationViewModel())
}
