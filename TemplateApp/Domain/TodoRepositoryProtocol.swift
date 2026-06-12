//
//  TodoRepositoryProtocol.swift
//  TemplateApp
//
//  Created by Edwin on 12/06/2026.
//  Copyright © 2026 Q42. All rights reserved.
//

import Foundation

protocol TodoRepositoryProtocol: AnyObject, Sendable {
    func saveTodo(title: String) -> TodoModel
}

final class MockTodoRepository: TodoRepositoryProtocol {
    func saveTodo(title: String) -> TodoModel {
        TodoModel(id: .init(), title: "Mock Todo")
    }
}

// MARK: - Dependencies

import Dependencies

extension DependencyValues {
    nonisolated var todoRepository: TodoRepositoryProtocol {
        get { self[TodoRepositoryKey.self] }
        set { self[TodoRepositoryKey.self] = newValue }
    }
}

nonisolated private enum TodoRepositoryKey: TestDependencyKey {
    static let testValue: TodoRepositoryProtocol = MockTodoRepository()
}

