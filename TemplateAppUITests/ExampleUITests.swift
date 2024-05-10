//
//  ExampleUITests.swift
//  TemplateAppUITests
//
//  Copyright © 2024 Q42. All rights reserved.
//

import XCTest
import Salad

final class ExampleUITests: XCTestCase {
    var scenario: Scenario<HomeView>!

    override func setUp() {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launch()
        scenario = Scenario(given: app)
    }

    func testExample() {
        scenario
            .then { homeView in
                XCTAssertFalse(homeView.userEmailLabel.exists)
            }
            .when(RefreshHomeView())
            .then { homeView in
                XCTAssertTrue(homeView.userEmailLabel.waitForExist(timeout: .fastNetworkCall))
                XCTAssertEqual(homeView.userEmailLabel.label, "example@q42.com")
            }
    }
}
