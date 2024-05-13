//
//  TemplateAppApp.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

@main
struct TemplateAppApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: TemplateAppAppDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
