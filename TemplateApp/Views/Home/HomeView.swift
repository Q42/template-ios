//
//  HomeView.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            switch viewModel.state {
            case let .data(userEmailTitle):
                if let userEmailTitle {
                    Text(userEmailTitle)
                        .accessibilityIdentifier("userEmailLabel")
                }
            case let .error(error):
                Text(error.localizedDescription)
                    .foregroundStyle(.red)
            case .loading:
                ProgressView()
            case .empty:
                EmptyView()
            }

            Button("Refresh") {
                Task {
                    await viewModel.refresh()
                }
            }
            .accessibilityIdentifier("refreshButton")
        }
        .padding()
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("HomeView")
        .navigationTitle("Home")
    }
}

#Preview("Data") {
    @Previewable @State var viewModel = HomeViewModel()
    viewModel.state = .data(userEmailTitle: "hello@q42.nl")
    return HomeView(viewModel: viewModel)
}

#Preview("Loading") {
    @Previewable @State var viewModel = HomeViewModel()
    viewModel.state = .loading
    return HomeView(viewModel: viewModel)
}

#Preview("Empty") {
    @Previewable @State var viewModel = HomeViewModel()
    viewModel.state = .empty
    return HomeView(viewModel: viewModel)
}

#Preview("Error") {
    @Previewable @State var viewModel = HomeViewModel()
    viewModel.state = .error(TemplateAppError(message: "Example error message"))
    return HomeView(viewModel: viewModel)
}
