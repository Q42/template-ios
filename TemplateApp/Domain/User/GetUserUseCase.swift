//
//  GetUserUseCase.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation
import Factory

class GetUserUseCase {
    @Injected(\.userRepository) var userRepository: UserRepositoryProtocol

    func invoke() async throws -> UserModel {
        try await userRepository.getUser()
    }
}
