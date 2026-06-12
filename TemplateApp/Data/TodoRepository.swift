//
//  TodoRepository.swift
//  TemplateApp
//
//  Created by Edwin on 12/06/2026.
//  Copyright © 2026 Q42. All rights reserved.
//

import Dependencies
import Foundation

class TodoRepository {
    @Dependency(\.uuid) var uuid
}

extension TodoRepository: TodoRepositoryProtocol {
    func saveTodo(title: String) -> TodoModel {
        TodoModel(id: uuid(), title: title)
    }
}
