//
//  PerformanceTests.swift
//  Ultimate PortfolioTests
//
//  Created by Kuba Milcarz on 11/6/23.
//

import XCTest
@testable import Ultimate_Portfolio

final class PerformanceTests: BaseTestCase {

    func testAwardCalculationPerformance() {
        for _ in 1...100 {
            dataConroller.createSampleData()
        }
        
        let awards = Array(repeating: Award.allAwards, count: 25).joined()
        XCTAssertEqual(awards.count, 500, "This checks the awards count is constant. Change this if you add awards.")
        
        measure {
            _ = awards.filter(dataConroller.hasEarned)
        }
    }
}
