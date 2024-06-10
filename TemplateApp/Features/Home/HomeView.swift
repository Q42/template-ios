//
//  HomeView.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

struct HomeView: View {
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
            default:
                EmptyView()
            }

            AsyncButton("Refresh") {
                await refresh()
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
