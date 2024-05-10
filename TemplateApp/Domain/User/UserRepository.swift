//
//  UserRepository.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

protocol UserRepository {
    func getUser() async throws -> User
}
