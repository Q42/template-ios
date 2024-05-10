//
//  UserRepositoryImpl.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation
import Factory

class UserRepositoryImpl: UserRepository {
    @Injected(\.userLocalDataSource) var userLocalDataSource
    @Injected(\.userRemoteDataSource) var userRemoteDataSource

    func getUser() async throws -> User {
        let userEntity = try await userRemoteDataSource.getUser()
        userLocalDataSource.setUser(userEntity: userEntity)
        let user = User(userEntity: userEntity)
        return user
    }
}
