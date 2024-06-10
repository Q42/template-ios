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

#Preview {
    HomeScreen()
}
