//
//  MockUsageStats.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 19/07/2024.
//

import Foundation

class MockUsageStats: UsageStats {
    static var lastEvent: UsageStatsEvent?
    static var lastData: String?
    
    static func sendUsageStats(event: UsageStatsEvent, data: String) async {
        self.lastEvent = event
        self.lastData = data
    }
    
    static func reset() {
        lastEvent = nil
        lastData = nil
    }
}


