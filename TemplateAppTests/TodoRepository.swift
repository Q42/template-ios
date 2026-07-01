//
//  TodoRepository.swift
//  TemplateAppTests
//
//  Created by Edwin on 12/06/2026.
//  Copyright © 2026 Q42. All rights reserved.
//

import Dependencies
import Foundation
@testable import TemplateApp
import Testing

/// Because of default actor isolation on the main target, this suite runs on the main actor, too.
@MainActor
struct TodoRepositoryTests {
    @Test func testSaveTodoUsesUUIDDependency() {
        let repository = withDependencies {
            $0.uuid = .incrementing
        } operation: {
            TodoRepository()
        }

        let first = repository.saveTodo(title: "Download Xcode beta")
        let second = repository.saveTodo(title: "Remove DerivedData")

        #expect(first.id == UUID(0))
        #expect(second.id == UUID(1))
        #expect(first.title == "Download Xcode beta")
        #expect(second.title == "Remove DerivedData")
    }
}
