//
//  Container.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation
import Factory

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

    var navigationGraph: Factory<NavigationGraph> {
        Factory(self) { NavigationGraph() }.singleton
    }
}
