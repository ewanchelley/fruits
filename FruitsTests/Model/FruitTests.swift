//
//  FruitTests.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 13/07/2024.
//

import XCTest

final class FruitTests: XCTestCase {

    let apple = Fruit(name: "Apple", price: 1.0000, weight: 0.1000)
    let pear = Fruit(name: "Pear", price: 0.01, weight: 3)
    let banana = Fruit(name: "Banana", price: 11, weight: 0.001)
    
    func testFormattedPrice() throws {
        XCTAssertEqual("£1.00", apple.formattedPrice)
        XCTAssertEqual("£0.01", pear.formattedPrice)
        XCTAssertEqual("£11.00", banana.formattedPrice)
    }
    
    func testFormattedWeight() throws {
        XCTAssertEqual("0.100 kg", apple.formattedWeight)
        XCTAssertEqual("3.000 kg", pear.formattedWeight)
        XCTAssertEqual("0.001 kg", banana.formattedWeight)
    }

}
