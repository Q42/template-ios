//
//  NavigationGraph.swift
//  WorkingProject
//
//  Created by Marcel Bloemendaal on 04/04/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import Foundation
import SwiftUI

enum Destination: Hashable, Identifiable {
    var id: Int { hashValue }
    
    case home
    case navigationExamples
    case exampleItemDetails(exampleItem: ExampleItem)
    case sheetExample
}

class NavigationGraph {
    @MainActor
    @ViewBuilder func createView(navigator: Navigator, destination: Destination) -> some View {
        switch destination {
        case .home:
            HomeScreen(navigator: navigator)
        case .navigationExamples:
            NavigationExamplesScreen(navigator: navigator)
        case .exampleItemDetails(let exampleItem):
            ExampleItemDetailsScreen(navigator: navigator, exampleItem: exampleItem)
        case .sheetExample:
            SheetExampleScreen(navigator: navigator)
        }
    }
}
