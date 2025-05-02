//
//  ViewModel.swift
//  WorkingProject
//
//  Created by Marcel Bloemendaal on 04/04/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import Foundation
import Factory
import SwiftUI

@MainActor class ViewModel : ObservableObject {
    private let navigator: Navigator

    init(navigator: Navigator) {
        self.navigator = navigator
    }

    func navigate(to destination: Destination) {
        navigator.navigate(to: destination)
    }

    func dismiss() {
        navigator.dismiss();
    }

    func dismissAll() {
        navigator.dismissAll()
    }

    func presentSheet(for destination: Destination) {
        navigator.presentSheet(for: destination)
    }

    func stopPresentingSheet() {
        navigator.stopPresentingSheet()
    }
}
