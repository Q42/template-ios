//
//  SheetExample.swift
//  TemplateApp
//
//  Created by Marcel Bloemendaal on 02/05/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import SwiftUI

struct SheetExampleScreen: View {
    @StateObject var viewModel: SheetExampleViewModel

    init(navigator: Navigator) {
        _viewModel = StateObject(wrappedValue: SheetExampleViewModel(navigator: navigator))
    }

    var body: some View {
        SheetExampleView(onCloseButtonPress: viewModel.onCloseButtonPress)
    }
}

struct SheetExampleView: View {
    let onCloseButtonPress: () -> Void

    var body: some View {
        Text("Sheet Example")
        Button("Close") {
            onCloseButtonPress()
        }
    }
}

#Preview {
    SheetExampleView(
        onCloseButtonPress: {}
    )
}
