//
//  ExampleTests.swift
//  TemplateAppTests
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Testing
@testable import TemplateApp

struct ExampleTests {
    @Test func example() throws {
        #expect(21 * 2 == 42, "Multiplication should work")
    }
}
