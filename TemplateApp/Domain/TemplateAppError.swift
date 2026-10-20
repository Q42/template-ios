//
//  TemplateAppError.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

struct TemplateAppError: Error {
    let message: String
}

extension TemplateAppError: LocalizedError {
    var errorDescription: String? {
        message
    }
}
