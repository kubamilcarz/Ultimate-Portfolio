//
//  DevelopmentTests.swift
//  Ultimate PortfolioTests
//
//  Created by Kuba Milcarz on 11/2/23.
//

import CoreData
import XCTest
@testable import Ultimate_Portfolio

final class DevelopmentTests: BaseTestCase {

    func testSampleDataCreationWorks() {
        dataConroller.createSampleData()
        
        XCTAssertEqual(dataConroller.count(for: Tag.fetchRequest()), 5, "There should be 5 sample Tags.")
        XCTAssertEqual(dataConroller.count(for: Issue.fetchRequest()), 50, "There should be 50 sample Issues.")
    }
    
    func testDeleteAllClearsEverything() {
        dataConroller.createSampleData()
        dataConroller.deleteAll()
        
        XCTAssertEqual(dataConroller.count(for: Tag.fetchRequest()), 0, "There should be 0 sample Tags.")
        XCTAssertEqual(dataConroller.count(for: Issue.fetchRequest()), 0, "There should be 0 sample Issues.")
    }

    func testExampleTagHasNoIssues() {
        let tag = Tag.example
        XCTAssertEqual(tag.issues?.count, 0, "The example tag should have 0 issues.")
    }
    
    func testExampleIssueIsHighPriority() {
        let issue = Issue.example
        XCTAssertEqual(issue.priority, 2, "The example issue should be high priority.")
    }
}
