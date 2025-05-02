//
//  Navigator.swift
//  WorkingProject
//
//  Created by Marcel Bloemendaal on 21/03/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import Foundation
import SwiftUI
import Factory

class Navigator: ObservableObject  {
    @Injected(\.navigationGraph) var navigationGraph: NavigationGraph

    @Published var navigationPath = [Destination]()
    @Published var sheetDestination: Destination?

    let presentingNavigator: Navigator?

    init(presentingNavigator: Navigator? = nil) {
        self.presentingNavigator = presentingNavigator
    }

    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }

    func dismiss() {
        if (navigationPath.isEmpty) {
            if let presentingNavigator = self.presentingNavigator {
                presentingNavigator.stopPresentingSheet()
            }
        } else {
            navigationPath.removeLast()
        }
    }

    func dismissAll() {
        if let presentingNavigator = self.presentingNavigator {
            presentingNavigator.stopPresentingSheet()
            return
        }

        navigationPath.removeAll()
    }

    func presentSheet(for destination: Destination) {
        sheetDestination = destination
    }

    func stopPresentingSheet() {
        sheetDestination = nil
    }

    @MainActor
    @ViewBuilder func view(for destination: Destination) -> some View {
        navigationGraph.createView(navigator: self, destination: destination)
    }
}

extension EnvironmentValues {
    @Entry var navigator = Navigator()
}
