//
//  GetUserUseCase.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation
import Factory

class GetUserUseCase {
    @Injected(\.userRepository) var userRepository: UserRepository

    func invoke() async throws -> User {
        try await userRepository.getUser()
    }
}
