//
//  MockNetworkManager.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 19/07/2024.
//

import Foundation

class MockNetworkManager: NetworkManaging {
    let successful: Bool
    
    init(successful: Bool) {
        self.successful = successful
    }
    
    func fetchAndDecodeJSON<T>(url: URL) async throws -> T where T : Decodable {
        if !successful {
            throw MockUnknownError.unknown("Fetching was not successful")
        }
        
        let mockFruitsDTO = FruitsDTO(fruit: [
            FruitDTO(type: "apple", price: 150, weight: 200)
        ])
        return mockFruitsDTO as! T
    }
}
