//
//  NetworkError.swift
//  Fruits
//
//  Created by Ewan Chelley on 15/07/2024.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidResponse
    case statusCodeError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response received."
        case .statusCodeError(let statusCode):
            return "Unexpected status code (\(statusCode))."
        }
    }
}
