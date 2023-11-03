//
//  TagTest.swift
//  Ultimate PortfolioTests
//
//  Created by Kuba Milcarz on 11/2/23.
//

import CoreData
import XCTest
@testable import Ultimate_Portfolio

final class TagTest: BaseTestCase {
    
    func testCreatingTagsAndIssues() {
        let targetCount = 10
        
        for _ in 0..<targetCount {
            let tag = Tag(context: managedObjectContext)
            
            for _ in 0..<targetCount {
                let issue = Issue(context: managedObjectContext)
                tag.addToIssues(issue)
            }
        }
        
        XCTAssertEqual(dataConroller.count(for: Tag.fetchRequest()), targetCount, "There should be \(targetCount) tags.")
        XCTAssertEqual(dataConroller.count(for: Issue.fetchRequest()), targetCount * targetCount, "There should be \(targetCount) issues.")
    }
    
    func testDeletingTagDoesNotDeleteIssue() throws {
        dataConroller.createSampleData()
        
        let request = NSFetchRequest<Tag>(entityName: "Tag")
        let tags = try managedObjectContext.fetch(request)
        
        dataConroller.delete(tags[0])
        
        XCTAssertEqual(dataConroller.count(for: Tag.fetchRequest()), 4, "There should be 4 tags after deleting 1 from our sample data.")
        XCTAssertEqual(dataConroller.count(for: Issue.fetchRequest()), 50, "There should still be 50 issues after deleting 1 from our sample data.")
    }
}
