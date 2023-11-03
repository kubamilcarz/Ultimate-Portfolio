//
//  Ultimate_PortfolioTests.swift
//  Ultimate PortfolioTests
//
//  Created by Kuba Milcarz on 11/2/23.
//

import CoreData
import XCTest
@testable import Ultimate_Portfolio

class BaseTestCase: XCTestCase {
    var dataConroller: DataController!
    var managedObjectContext: NSManagedObjectContext!
    
    override func setUpWithError() throws {
        dataConroller = DataController(inMemory: true)
        managedObjectContext = dataConroller.container.viewContext
    }
}
