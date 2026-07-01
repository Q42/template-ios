//
//  GetUserUseCase.swift
//  TemplateAppTests
//
//  Created by Edwin on 03/06/2026.
//  Copyright © 2026 Q42. All rights reserved.
//

import Dependencies
@testable import TemplateApp
import Testing

struct GetUserUseCaseTests {
    @Test(arguments: [
        "mock@user.repository.com",
        "mathijs@q42.nl",
    ])
    func testGetValidUser(email: String) async throws {
        let mockUserRepository = MockUserRepository(user: .init(email: email))
        let useCase = withDependencies {
            $0.userRepository = mockUserRepository
        } operation: {
            GetUserUseCase()
        }

        let result = try await useCase.invoke()

        #expect(result.email == email)
    }
}
