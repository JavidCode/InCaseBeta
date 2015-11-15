//
//  InCaseBetaTests.swift
//  InCaseBetaTests
//
//  Created by Javid Beykzadeh on 11/5/15.
//  Copyright © 2015 JavidCode. All rights reserved.
//

import XCTest
//@testable import InCaseBeta

class InCaseBetaTests: XCTestCase {
    // MARK: FoodTracker Tests
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testAssetInitialization() {
        // Success case.
        let potentialItem = Asset(name: "Computer", desc: "My MacBook Pro", photo: nil)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Asset(name: "", desc: "", photo: nil)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let noDesc = Asset(name: "Really bad rating", desc: "Nice", photo: nil)
        XCTAssertNotNil(noDesc, "A description is required")
    }
}
