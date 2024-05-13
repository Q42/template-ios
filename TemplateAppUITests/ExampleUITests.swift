//
//  TemplateAppUITests.swift
//  TemplateAppUITests
//
//  Created by Mathijs Bernson on 17/01/2024.
//

//
//  ExampleUITests.swift
//  TemplateAppTests
//
//  Copyright © 2024 Q42. All rights reserved.
//

import XCTest
import Salad

final class ExampleUITests: XCTestCase {
    var scenario: Scenario<RootView>!

    override func setUp() {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launch()
        scenario = Scenario(given: app)
    }

    func testExample() {
        scenario
            .then { rootView in
                XCTAssertTrue(rootView.identifyingElement.staticTexts["Hello, world!"].waitForExist(timeout: .asyncUI),
                              "Expected to see 'Hello, world!' label")
            }
    }
}
