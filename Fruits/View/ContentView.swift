//
//  ContentView.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = NavigationViewModel()
    private var fruitsListViewModel = FruitsListViewModel()
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            FruitsList(viewModel: fruitsListViewModel)
        }
        .environmentObject(navigation)
    }
}

#Preview {
    ContentView()
}
