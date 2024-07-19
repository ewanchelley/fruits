//
//  MockErrorHandler.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 19/07/2024.
//

import Foundation

enum MockUnknownError: Error, LocalizedError {
    case unknown(String)
    
    var errorDescription: String? {
        switch self {
        case .unknown(let message):
            return message
        }
    }
}

func getMockErrorHandler() -> ErrorHandler {
    MockUsageStats.reset()
    return ErrorHandler(usageStats: MockUsageStats.self)
}
