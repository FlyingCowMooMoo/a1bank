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
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let app = XCUIApplication()
        app.buttons["loginButton"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("user1")
        
        //tap somewhere outside the textfield
        let element = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        element.tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        element.tap()
        app.buttons["Login"].tap()
        XCTAssertTrue(app.tables.element.exists)
    }
    
    func testAboutUsPageHasPhoneNumber()
    {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let app = XCUIApplication()
        
        app.buttons["contactUs"].tap()
        
        XCTAssertTrue(app.staticTexts["Ph:+61000000000"].exists)
    }
    
    func testAboutIsPageHasTitle()
    {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let app = XCUIApplication()
        
        app.buttons["contactUs"].tap()
        
        app.staticTexts["Fraud Bank Non-Profit Bank"]
    }
    
}
