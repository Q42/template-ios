//
//  HomeViewModel.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

@MainActor class NavigationExamplesViewModel: ViewModel {
    @Published var viewState = NavigationViewState()

    let sheetItem = ExampleItem(title: "The sheet item")

    func onExampleItemSelect(exampleItem: ExampleItem) {
        navigate(to: .exampleItemDetails(exampleItem: exampleItem))
    }

    func onSheetButtonPress() {
        presentSheet(for: .sheetExample)
    }
}
