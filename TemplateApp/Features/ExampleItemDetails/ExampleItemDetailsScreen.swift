//
//  LabelScreen.swift
//  TemplateApp
//
//  Created by Marcel Bloemendaal on 18/04/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import SwiftUI

struct ExampleItemDetailsScreen: View {
    let exampleItem: ExampleItem

    @StateObject var viewModel: ExampleItemDetailsViewModel

    init(navigator: Navigator, exampleItem: ExampleItem) {
        _viewModel = StateObject(wrappedValue: ExampleItemDetailsViewModel(navigator: navigator))
        self.exampleItem = exampleItem
    }

    var body: some View {
        ExampleItemDetailsView(exampleItem: exampleItem)
    }
}

struct ExampleItemDetailsView: View {
    let exampleItem: ExampleItem

    var body: some View {
        Text(exampleItem.title)
    }
}

#Preview {
    ExampleItemDetailsView(exampleItem: ExampleItem.example)
}
