//
//  TemplateAppApp.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Dependencies
import SwiftUI

@main
struct TemplateAppApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: TemplateAppAppDelegate

    init() {
        bootstrap()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }

    func bootstrap() {
        // don't bootstrap the app if we're testing
        guard context == .live else { return }

        // TODO: Set up dependencies
    }
}
