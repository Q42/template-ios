//
//  UserRepositoryProtocol.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUser() async throws -> UserModel
}
