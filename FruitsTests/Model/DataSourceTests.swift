//
//  DataSourceTests.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 13/07/2024.
//

import XCTest

final class DataSourceTests: XCTestCase {
    
    func testFetchFruitsSuccessful() async throws {
        let successfulNetworkManager = MockNetworkManager(successful: true)
        let dataSource = DataSource(networkManager: successfulNetworkManager)
        let fruits = await dataSource.fetchFruits()
        
        XCTAssertEqual("Apple", fruits![0].name)
        XCTAssertEqual(1.50, fruits![0].price)
        XCTAssertEqual(0.200, fruits![0].weight)
    }
    
    func testFetchFruitsUnsuccessful() async throws {
        let unsuccessfulNetworkManager = MockNetworkManager(successful: false)
        let dataSource = DataSource(networkManager: unsuccessfulNetworkManager)
        let fruits = await dataSource.fetchFruits()
        
        XCTAssertNil(fruits)
    }
    
    func testToFruits() throws {
        let fruitsDTO = FruitsDTO(fruit: [
            FruitDTO(type: "apple", price: 100, weight: 215),
            FruitDTO(type: "banana", price: 200, weight: 15),
            FruitDTO(type: "cherry", price: 50, weight: 210),
        ])
        let fruits = fruitsDTO.toFruits()
        
        XCTAssertEqual("Apple", fruits[0].name)
        XCTAssertEqual(1.00, fruits[0].price)
        XCTAssertEqual(0.215, fruits[0].weight)
        XCTAssertEqual("Banana", fruits[1].name)
        XCTAssertEqual(2.00, fruits[1].price)
        XCTAssertEqual(0.015, fruits[1].weight)
        XCTAssertEqual("Cherry", fruits[2].name)
        XCTAssertEqual(0.50, fruits[2].price)
        XCTAssertEqual(0.210, fruits[2].weight)
    }

    class MockNetworkManager: NetworkManaging {
        let successful: Bool
        
        init(successful: Bool) {
            self.successful = successful
        }
        
        enum NetworkError: Error {
            case invalidResponse
        }
        
        func fetchAndDecodeJSON<T>(url: URL) async throws -> T where T : Decodable {
            if !successful {
                throw NetworkError.invalidResponse
            }
            
            let mockFruitsDTO = FruitsDTO(fruit: [
                FruitDTO(type: "apple", price: 150, weight: 200)
            ])
            return mockFruitsDTO as! T
        }
    }
    
}
