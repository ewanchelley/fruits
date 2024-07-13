//
//  Fruit.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import Foundation

struct Fruit: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
    let weight: Double
}

extension Fruit {
    var formattedPrice: String {
        let formattedString = String(format: "%.2f", price)
        return "£\(formattedString)"
    }
    
    var formattedWeight: String {
        let formattedString = String(format: "%.3f", weight)
        return "\(formattedString) kg"
    }
}
