//
//  ErrorHandlerTests.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 19/07/2024.
//

import XCTest



final class ErrorHandlerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        MockUsageStats.reset()
    }
    
    func testErrorHandlerNetworkErrorInvalidResponse() async throws {
        let errorHandler = ErrorHandler(usageStats: MockUsageStats.self)
        let error = NetworkError.invalidResponse
        
        await errorHandler.handleError(error)
        
        XCTAssertEqual(UsageStatsEvent.error, MockUsageStats.lastEvent)
        XCTAssertEqual("Invalid response received", MockUsageStats.lastData)
    }
    
    func testErrorHandlerNetworkErrorStatusCode() async throws {
        let errorHandler = ErrorHandler(usageStats: MockUsageStats.self)
        let error = NetworkError.statusCodeError(404)
        
        await errorHandler.handleError(error)
        
        XCTAssertEqual(UsageStatsEvent.error, MockUsageStats.lastEvent)
        XCTAssertEqual("Unexpected status code: 404", MockUsageStats.lastData)
    }
    
    func testUnexpectedError() async throws {
        let errorHandler = ErrorHandler(usageStats: MockUsageStats.self)
        let error = MockUnknownError.unknown("This is unexpected")
        
        await errorHandler.handleError(error)
        
        XCTAssertEqual(UsageStatsEvent.error, MockUsageStats.lastEvent)
        XCTAssertEqual("Unknown error: This is unexpected", MockUsageStats.lastData)
    }

}
