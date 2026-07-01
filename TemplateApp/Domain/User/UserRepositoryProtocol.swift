//
//  UserRepositoryProtocol.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

protocol UserRepositoryProtocol: AnyObject, Sendable {
    func getUser() async throws -> UserModel
}

final class MockUserRepository: UserRepositoryProtocol {
    var user: UserModel

    nonisolated
    init(user: UserModel = UserModel(email: "mock@user.repository.com")) {
        self.user = user
    }

    func getUser() async throws -> UserModel {
        user
    }
}

// MARK: - Dependencies

import Dependencies

extension DependencyValues {
    nonisolated var userRepository: UserRepositoryProtocol {
        get { self[UserRepositoryKey.self] }
        set { self[UserRepositoryKey.self] = newValue }
    }
}

nonisolated private enum UserRepositoryKey: TestDependencyKey {
    static let testValue: UserRepositoryProtocol = MockUserRepository()
}
