//
//  UserEntity+Model.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

extension UserModel {
    init(userEntity: UserEntity) {
        email = userEntity.email
    }
}
