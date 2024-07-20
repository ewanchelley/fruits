//
//  NavigationViewModel.swift
//  Fruits
//
//  Created by Ewan Chelley on 20/07/2024.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var path = NavigationPath()

    private let usageStats: UsageStats.Type
    
    private var startTime: DispatchTime?
    private var endTime: DispatchTime?
    
    init(usageStats: UsageStats.Type = UsageStatsManager.self) {
        self.usageStats = usageStats
    }
    
    func navigateTo(_ item: any Hashable) {
        startTiming()
        path.append(item)
    }
    
    func navigateBack() {
        startTiming()
        path.removeLast()
    }
    
    func viewLoaded() async {
        finishTiming()
        await sendUsageStats()
    }
    
    private func startTiming() {
        reset()
        startTime = DispatchTime.now()
    }
    
    private func finishTiming() {
        endTime = DispatchTime.now()
    }
    
    private func reset() {
        startTime = nil
        endTime = nil
    }
    
    private func sendUsageStats() async {
        // If there is not a start and end time then don't send statistics
        // This is expected the first time the parent view loads
        guard let startTime = startTime, let endTime = endTime else { return }
        
        guard startTime < endTime else { return }
        
        await usageStats.sendUsageStats(event: .display, data: elapsedTimeMilliseconds(startTime, endTime))
    }
    
}
