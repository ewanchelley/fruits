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
    
    func testErrorHandlerNetworkErrorInvalidResponse() throws {
        let errorHandler = ErrorHandler(usageStats: MockUsageStats.self)
        let error = NetworkError.invalidResponse
        
        errorHandler.handleError(error)
        sleep(1)
        
        XCTAssertEqual(UsageStatsEvent.error, MockUsageStats.lastEvent)
        XCTAssertEqual("Invalid response received", MockUsageStats.lastData)
    }
    
    func testErrorHandlerNetworkErrorStatusCode() throws {
        let errorHandler = ErrorHandler(usageStats: MockUsageStats.self)
        let error = NetworkError.statusCodeError(404)
        
        errorHandler.handleError(error)
        sleep(1)
        
        XCTAssertEqual(UsageStatsEvent.error, MockUsageStats.lastEvent)
        XCTAssertEqual("Unexpected status code: 404", MockUsageStats.lastData)
    }
    
    func testUnexpectedError() throws {
        let errorHandler = ErrorHandler(usageStats: MockUsageStats.self)
        let error = MockUnknownError.unknown("This is unexpected")
        
        errorHandler.handleError(error)
        sleep(1)
        
        XCTAssertEqual(UsageStatsEvent.error, MockUsageStats.lastEvent)
        XCTAssertEqual("Unknown error: This is unexpected", MockUsageStats.lastData)
    }

}
