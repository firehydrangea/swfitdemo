//
//  swfitdemoUITests.swift
//  swfitdemoUITests
//
//  Created by Sarah Kudrick on 1/27/23.
//

import XCTest

class swfitdemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSwitchToMapTab() {
        let app = XCUIApplication()
        app.launch()
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        let mapButton = tabBar.buttons["MAP"]
        mapButton.tap()
        let titleStaticText = app.staticTexts["Saint Vincent College"]
        titleStaticText.tap()
        XCTAssert(titleStaticText.exists)

    }
    func testSwitchToHomeTab(){
        let app = XCUIApplication()
        app.launch()
        let tabBar = app.tabBars["Tab Bar"]

        let mapButton = tabBar.buttons["MAP"]
        mapButton.tap()
        let homeButton = tabBar.buttons["HOME"]
        homeButton.tap()
        let helloStaticText = app.staticTexts["Hello"]
        helloStaticText.tap()
        XCTAssert(helloStaticText.exists)
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    


}
