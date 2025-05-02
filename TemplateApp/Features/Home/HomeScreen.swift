//
//  HomeScreen.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel

    init(navigator: Navigator) {
        _viewModel = StateObject(wrappedValue: HomeViewModel(navigator: navigator))
    }

    var body: some View {
        HomeView(
            viewState: viewModel.uiState,
            refresh: viewModel.refresh,
            onNavigationExamplesButtonPress: viewModel.onNavigationExamplesButtonPress
        )
        .navigationTitle("Home")
    }
}

private struct HomeView: View {
    let viewState: HomeViewState
    let refresh: () async -> Void
    let onNavigationExamplesButtonPress: () -> Void

    var body: some View {
        VStack {
            switch viewState {
            case .data(let userEmailTitle):
                if let userEmailTitle {
                    Text(userEmailTitle)
                        .accessibilityIdentifier("userEmailLabel")
                }
            case .error(let error):
                Text(error.localizedDescription)
                    .foregroundStyle(.red)
            case .loading:
                ProgressView()
            case .empty:
                EmptyView()
            }

            Button("Refresh") {
                Task {
                    await refresh()
                }
            }
            .accessibilityIdentifier("refreshButton")
            Spacer()
                .frame(height: 30)
            Button("Navigation Examples") {
                onNavigationExamplesButtonPress()
            }
            .accessibilityIdentifier("Navigation Examples")
        }
        .padding()
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("HomeView")
    }
}

#Preview("Data") {
    HomeView(
        viewState: .data(userEmailTitle: "hello@q42.nl"),
        refresh: {},
        onNavigationExamplesButtonPress: {}
    )
}

#Preview("Loading") {
    HomeView(
        viewState: .loading,
        refresh: {},
        onNavigationExamplesButtonPress: {}
    )
}

#Preview("Empty") {
    HomeView(
        viewState: .empty,
        refresh: {},
        onNavigationExamplesButtonPress: {}
    )
}

#Preview("Error") {
    HomeView(
        viewState: .error(TemplateAppError(message: "Example error message")),
        refresh: {},
        onNavigationExamplesButtonPress: {}
    )
}
