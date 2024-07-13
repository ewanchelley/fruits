//
//  Fruit.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import Foundation

struct Fruit: Identifiable, Hashable {
    let id = UUID()
    let type: String
    let price: Int
    let weight: Int
}
