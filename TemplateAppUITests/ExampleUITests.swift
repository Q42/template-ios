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
        // Custom launch arguments can be set here
        // app.launchArguments = ["testing"]
        app.launch()
        // A scenario provides the starting point of your tests ('GIVEN <screen>'). In each test case,
        // you chain behaviors ('WHEN I do <action>') and assertions ('THEN I expect <result>') using the scenario.
        scenario = Scenario(given: app)
    }

    func testExample() {
        // Example of a behavior-driven test
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
