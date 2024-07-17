//
//  Task+Extensions.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

extension Task where Failure == Never, Success == Never {
    static func sleep(seconds: Double) async throws {
        try await sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
    }
}
