//
//  GetUserUseCase.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Factory
import Foundation

class GetUserUseCase {
    @Injected(\.userRepository) var userRepository: UserRepositoryProtocol

    func invoke() async throws -> UserModel {
        try await userRepository.getUser()
    }
}
