//
//  ExampleTests.swift
//  TemplateAppTests
//
//  Copyright © 2024 Q42. All rights reserved.
//

@testable import TemplateApp
import Testing

struct ExampleTests {
    @Test func example() {
        #expect(21 * 2 == 42, "Multiplication should work")
    }
}
