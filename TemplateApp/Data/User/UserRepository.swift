//
//  UserRepository.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Dependencies
import Foundation

final class UserRepository: UserRepositoryProtocol {
    private let userLocalDataSource: UserLocalDataSource
    private let userRemoteDataSource: UserRemoteDataSource

    init(userLocalDataSource: UserLocalDataSource, userRemoteDataSource: UserRemoteDataSource) {
        self.userLocalDataSource = userLocalDataSource
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func getUser() async throws -> UserModel {
        let userEntity = try await userRemoteDataSource.getUser()
        userLocalDataSource.setUser(userEntity: userEntity)
        let user = UserModel(userEntity: userEntity)
        return user
    }
}

