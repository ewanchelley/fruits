//
//  NavigationViewModelTests.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 20/07/2024.
//

import XCTest
import SwiftUI

final class NavigationViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        MockUsageStats.reset()
    }
    
    func testNavigatingToNewDestinationsAddsToThePath() throws {
        let navigation = NavigationViewModel(usageStats: MockUsageStats.self)
        
        let destinationA = MockNavDestination()
        let destinationB = MockNavDestination()
        let destinationC = MockNavDestination()
        
        navigation.navigateTo(destinationA)
        navigation.navigateTo(destinationB)
        navigation.navigateTo(destinationC)
        
        let expectedPath = NavigationPath([
            destinationA, destinationB, destinationC
        ])
        
        XCTAssertEqual(expectedPath, navigation.path)
    }
    
    func testNavigatingForwardsAndBackwards() throws {
        let navigation = NavigationViewModel(usageStats: MockUsageStats.self)
        
        let destinationA = MockNavDestination()
        let destinationB = MockNavDestination()
        let destinationC = MockNavDestination()
        
        navigation.navigateTo(destinationA)
        navigation.navigateTo(destinationB)
        navigation.navigateTo(destinationC)
        navigation.navigateBack()
        navigation.navigateBack()
        
        let expectedPath = NavigationPath([destinationA])
        
        XCTAssertEqual(expectedPath, navigation.path)
    }
    
    func testStartingNavigationDoesNotImmediatelySendUsageStats() throws {
        let navigation = NavigationViewModel(usageStats: MockUsageStats.self)
        
        let destinationA = MockNavDestination()
        navigation.navigateTo(destinationA)
        
        XCTAssertEqual(nil, MockUsageStats.lastEvent)
        XCTAssertEqual(nil, MockUsageStats.lastData)
    }
    
    func testViewLoadingDoesNotImmediatelySendUsageStatsIfTimingNotStarted() async throws {
        let navigation = NavigationViewModel(usageStats: MockUsageStats.self)
        
        await navigation.viewLoaded()
        
        XCTAssertEqual(nil, MockUsageStats.lastEvent)
        XCTAssertEqual(nil, MockUsageStats.lastData)
    }
    
    func testUsageStatsSentAfterTimingAndThenViewLoading() async throws {
        let navigation = NavigationViewModel(usageStats: MockUsageStats.self)
        
        let destinationA = MockNavDestination()
        navigation.navigateTo(destinationA)
        await navigation.viewLoaded()
        XCTAssertEqual(UsageStatsEvent.display, MockUsageStats.lastEvent)
        XCTAssertNotEqual(nil, MockUsageStats.lastData)
    }

}

struct MockNavDestination: Hashable, Identifiable {
    let id = UUID()
}
