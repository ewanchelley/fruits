//
//  ErrorHandler.swift
//  Fruits
//
//  Created by Ewan Chelley on 19/07/2024.
//

import Foundation

class ErrorHandler {
    private let usageStats: UsageStats.Type
    
    init(usageStats: UsageStats.Type = UsageStatsManager.self) {
        self.usageStats = usageStats
    }
    
    func handleError(_ error: Error) async {
        let appError = (error as? AppError) ?? UnknownError.unknown("Unknown error: \(error.localizedDescription)")
        await usageStats.sendUsageStats(event: .error, data: appError.localizedDescription)
    }
}
