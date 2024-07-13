//
//  FruitsListViewModel.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import Foundation
import Observation

@Observable
class FruitsListViewModel {
    private let dataSource = DataSource()
    private(set) var fruits: [Fruit] = []
    
    func fetchFruits() async {
        if let fetchedFruits = await dataSource.fetchFruits() {
            fruits = fetchedFruits
        } 
    }
}
