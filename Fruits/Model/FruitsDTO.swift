//
//  FruitsDTO.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import Foundation

struct FruitsDTO: Decodable {
    let fruit: [FruitDTO]
}

struct FruitDTO: Decodable {
    let type: String
    let price: Int
    let weight: Int
}
