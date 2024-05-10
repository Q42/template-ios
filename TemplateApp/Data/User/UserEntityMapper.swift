//
//  UserEntityMapper.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

extension User {
    init(userEntity: UserEntity) {
        self.email = userEntity.email
    }
}
