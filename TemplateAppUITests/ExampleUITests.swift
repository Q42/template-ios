//
//  ExampleUITests.swift
//  TemplateAppUITests
//
//  Copyright © 2024 Q42. All rights reserved.
//

import XCTest

final class ExampleUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testRefreshShowsUserEmail() {
        let app = XCUIApplication()
        app.launch()

        let homeView = app.otherElements["HomeView"]
        let userEmailLabel = homeView.staticTexts["userEmailLabel"]
        let refreshButton = homeView.buttons["refreshButton"]

        XCTAssertTrue(homeView.waitForExistence(timeout: 5))
        XCTAssertFalse(userEmailLabel.exists)

        refreshButton.tap()

        // The remote data source simulates a network delay of one second
        XCTAssertTrue(userEmailLabel.waitForExistence(timeout: 5))
        XCTAssertEqual(userEmailLabel.label, "example@q42.com")
    }
}
