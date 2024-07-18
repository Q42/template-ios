//
//  HomeScreen.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        HomeView(
            viewState: viewModel.uiState,
            refresh: viewModel.refresh
        )
        .navigationTitle("Home")
    }
}

private struct HomeView: View {
    let viewState: HomeViewState
    let refresh: () async -> Void

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
        }
        .padding()
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("HomeView")
    }
}

#Preview("Data") {
    HomeView(
        viewState: .data(userEmailTitle: "hello@q42.nl"),
        refresh: {}
    )
}

#Preview("Loading") {
    HomeView(
        viewState: .loading,
        refresh: {}
    )
}

#Preview("Empty") {
    HomeView(
        viewState: .empty,
        refresh: {}
    )
}

#Preview("Error") {
    HomeView(
        viewState: .error(TemplateAppError(message: "Example error message")),
        refresh: {}
    )
}
