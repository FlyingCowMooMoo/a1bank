//
//  a1bankUITests.swift
//  a1bankUITests
//
//  Created by Panagiotis Papastamatis on 21/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import XCTest

class a1bankUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHomeHasButtons()
    {
        let app = XCUIApplication()
        XCTAssertGreaterThan(app.buttons.count, 0)
    }
    
    func testHomeDoesNotHaveTooManyButtons()
    {
        let app = XCUIApplication()
        XCTAssertEqual(app.buttons.count, 2)
    }
    
    func testHomeHasLogo()
    {
        let app = XCUIApplication()
        XCTAssert(app.images["homelogo"].exists)
    }
    
    func testHomeHasCopyrightText()
    {
        let app = XCUIApplication()
        XCTAssert(app.textFields["copyrighthome"].exists)
    }
    
    func testLoginHasUsernameTextField()
    {
        let app = XCUIApplication()
        app.buttons["loginButton"].tap()
        let tf = app.textFields["Username"]
        XCTAssert(tf.exists)
    }
    
    func testLoginHasUsernameLabel()
    {
        let app = XCUIApplication()
        app.buttons["loginButton"].tap()
        let tf = app.staticTexts["Username"]
        XCTAssert(tf.exists)
    }
    
    func testLoginHasPasswordLabel()
    {
        let app = XCUIApplication()
        app.buttons["loginButton"].tap()
        let tf = app.staticTexts["Password"]
        XCTAssert(tf.exists)
    }
    
    func testAccountPageHasTableView()
    {
        let app = XCUIApplication()
        app.buttons["loginButton"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("user1")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCUIDevice.sharedDevice().orientation = .Portrait
        let element = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        element.tap()
        element.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        app.buttons["Login"].tap()
        XCTAssertTrue(app.tables.element.cells.elementBoundByIndex(2).exists)
    }
    
    func testExample() {
        
        
    }
    
}
