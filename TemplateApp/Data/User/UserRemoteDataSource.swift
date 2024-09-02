//
//  UserRemoteDataSource.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

class UserRemoteDataSource {
    func getUser() async throws -> UserEntity {
        try await Task.sleep(seconds: 1.0)
        return UserEntity(email: "example@q42.com")
    }
}
