//
//  GetUserUseCase.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Dependencies
import Foundation

class GetUserUseCase {
    @Dependency(\.userRepository) var userRepository

    func invoke() async throws -> UserModel {
        try await userRepository.getUser()
    }
}
