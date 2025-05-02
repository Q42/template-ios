//
//  HomeScreen.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

struct NavigationExamplesScreen: View {
    @StateObject var viewModel: NavigationExamplesViewModel

    init(navigator: Navigator) {
        _viewModel = StateObject(wrappedValue: NavigationExamplesViewModel(navigator: navigator))
    }

    var body: some View {
        NavigationExamplesView(
            viewState: viewModel.viewState,
            onExampleItemSelect: viewModel.onExampleItemSelect,
            onSheetButtonPress: viewModel.onSheetButtonPress
        )
        .navigationTitle("Navigation Examples")
    }
}

private struct NavigationExamplesView: View {
    let viewState: NavigationViewState
    let onExampleItemSelect: (ExampleItem) -> Void
    let onSheetButtonPress: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewState.exampleItems) { exampleItem in
                Button(exampleItem.title) {
                    onExampleItemSelect(exampleItem)
                }
                .frame(height: 44)
                .accessibilityIdentifier(exampleItem.title)
            }
            .listStyle(.plain)

            let sheetButtonTitle = "Show item in sheet"
            Button(sheetButtonTitle) {
                onSheetButtonPress()
            }
            .frame(height: 44)
            .accessibilityIdentifier(sheetButtonTitle)

            Spacer()
                .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("NavigationExamplesView")
    }
}

#Preview {
    NavigationExamplesView(
        viewState: NavigationViewState(),
        onExampleItemSelect: { _ in },
        onSheetButtonPress: {}
    )
}
