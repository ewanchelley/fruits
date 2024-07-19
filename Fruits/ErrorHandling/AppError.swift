//
//  AppError.swift
//  Fruits
//
//  Created by Ewan Chelley on 19/07/2024.
//

import Foundation

protocol AppError: Error, LocalizedError {}

enum UnknownError: AppError {
    case unknown(String)
    
    var errorDescription: String? {
        switch self {
        case .unknown(let message):
            return message
        }
    }
}
