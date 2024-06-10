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

    var userRepository: Factory<UserRepository> {
        Factory(self) { UserRepositoryImpl() }
    }

    var userRemoteDataSource: Factory<UserRemoteDataSource> {
        Factory(self) { UserRemoteDataSource() }
    }

    var userLocalDataSource: Factory<UserLocalDataSource> {
        Factory(self) { UserLocalDataSource() }
    }
}
