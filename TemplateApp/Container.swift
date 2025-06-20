//
//  Container.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Factory
import Foundation

extension Container: @retroactive AutoRegistering {
    public func autoRegister() {
        // Injected dependencies are singletons by default.
        // Check the Factory documentation for more information about the scopes:
        // https://hmlongco.github.io/Factory/documentation/factory/scopes
        manager.defaultScope = .singleton
    }
}

extension Container {
    // MARK: User

    var userRepository: Factory<UserRepositoryProtocol> {
        Factory(self) { UserRepository() }
    }

    var userRemoteDataSource: Factory<UserRemoteDataSource> {
        Factory(self) { UserRemoteDataSource() }
    }

    var userLocalDataSource: Factory<UserLocalDataSource> {
        Factory(self) { UserLocalDataSource() }
    }
}
