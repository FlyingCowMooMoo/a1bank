//
//  a1bankTests.swift
//  a1bankTests
//
//  Created by Panagiotis Papasyamatis on 21/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import XCTest
@testable import a1bank

class a1bankTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
}
