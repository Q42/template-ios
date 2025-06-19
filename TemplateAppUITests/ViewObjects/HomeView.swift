//
//  HomeView.swift
//  TemplateAppUITests
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Salad
import XCTest

struct HomeView: ViewObject {
    let root: XCUIElement
    let identifyingElementId: String = "HomeView"

    var userEmailLabel: XCUIElement {
        identifyingElement.staticTexts["userEmailLabel"]
    }

    var refreshButton: XCUIElement {
        identifyingElement.buttons["refreshButton"]
    }
}
