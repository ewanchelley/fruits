//
//  DataSource.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import Foundation

class DataSource {
    private let networkManager: NetworkManaging
    private let errorHandler: ErrorHandler
    
    init(networkManager: NetworkManaging, errorHandler: ErrorHandler){
        self.networkManager = networkManager
        self.errorHandler = errorHandler
    }
    
    func fetchFruits() async -> [Fruit]? {
        let endpoint = "/data.json"
        let url = URL(string: Constants.fruitsURL + endpoint)!
        let fruitsDTO: FruitsDTO
        do {
            fruitsDTO = try await networkManager.fetchAndDecodeJSON(url: url)
            print("Fruits fetched successfully!")
        } catch {
            await errorHandler.handleError(error)
            return nil
        }
        return fruitsDTO.toFruits()
    }
    
}

extension FruitsDTO {
    func toFruits() -> [Fruit] {
        return self.fruit.map { fruitDTO in
            Fruit(
                name: fruitDTO.type.capitalized,
                price: Double(fruitDTO.price) / 100.0,
                weight: Double(fruitDTO.weight) / 1000.0
            )
        }
    }
}
