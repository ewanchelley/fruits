//
//  UsageStatsTests.swift
//  FruitsTests
//
//  Created by Ewan Chelley on 15/07/2024.
//

import XCTest

final class UsageStatsTests: XCTestCase {

    func testBuildLoadUrl() async throws {
        let url = StatsURLBuilder.buildUrl(event: .load, data: "100")
        XCTAssertEqual("https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=load&data=100", url.absoluteString)
    }
    
    func testBuildDisplayUrl() async throws {
        let url = StatsURLBuilder.buildUrl(event: .display, data: "3000")
        XCTAssertEqual("https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=display&data=3000", url.absoluteString)
    }
    
    func testBuildErrorUrl() async throws {
        let url = StatsURLBuilder.buildUrl(event: .error, data: "null pointer at line 5")
        XCTAssertEqual(
            "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=error&data=null%20pointer%20at%20line%205",
            url.absoluteString
        )
    }

    func testElapsedTime100Milliseconds() throws {
        let start = DispatchTime(uptimeNanoseconds: 50_000_000)
        let end = DispatchTime(uptimeNanoseconds: 150_000_000)
        let elapsed = elapsedTimeMilliseconds(start, end)
        XCTAssertEqual("100", elapsed)
    }
    
    func testElapsedTime0Milliseconds() throws {
        let start = DispatchTime(uptimeNanoseconds: 0)
        let end = DispatchTime(uptimeNanoseconds: 0)
        let elapsed = elapsedTimeMilliseconds(start, end)
        XCTAssertEqual("0", elapsed)
    }

}
