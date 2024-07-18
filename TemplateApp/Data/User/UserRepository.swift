//
//  UserRepository.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation
import Factory

class UserRepository: UserRepositoryProtocol {
    @Injected(\.userLocalDataSource) var userLocalDataSource
    @Injected(\.userRemoteDataSource) var userRemoteDataSource

    func getUser() async throws -> UserModel {
        let userEntity = try await userRemoteDataSource.getUser()
        userLocalDataSource.setUser(userEntity: userEntity)
        let user = UserModel(userEntity: userEntity)
        return user
    }
}
