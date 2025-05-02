//
//  NavigationView.swift
//  WorkingProject
//
//  Created by Marcel Bloemendaal on 04/04/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import SwiftUI

struct NavigationRoot: View {
    let rootDestination: Destination

    @StateObject private var navigator = Navigator()

    init(rootDestination: Destination, presentingNavigator: Navigator? = nil) {
        _navigator = StateObject(wrappedValue: Navigator(presentingNavigator: presentingNavigator))
        self.rootDestination = rootDestination
    }

    var body: some View {
        NavigationStack(path: $navigator.navigationPath) {
            navigator.view(for: rootDestination)
            .navigationDestination(for: Destination.self) { destination in
                navigator.view(for: destination)
            }
        }
        .sheet(item: $navigator.sheetDestination) { destination in
            NavigationRoot(rootDestination: destination)
                .task {
                    sleep(3)
                    navigator.stopPresentingSheet()
                }
        }
    }
}
