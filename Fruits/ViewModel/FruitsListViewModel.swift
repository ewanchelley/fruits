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
    private let errorHandler: ErrorHandler
    private let networkManager: NetworkManaging
    private let dataSource: DataSource
    
    private(set) var fruits: [Fruit] = []
    
    init() {
        self.errorHandler = ErrorHandler()
        self.networkManager = NetworkManager()
        self.dataSource = DataSource(networkManager: networkManager, errorHandler: errorHandler)
    }

    func fetchFruits() async {
        if let fetchedFruits = await dataSource.fetchFruits() {
            fruits = fetchedFruits
        } 
    }
}
