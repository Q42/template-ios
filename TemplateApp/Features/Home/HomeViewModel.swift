//
//  HomeViewModel.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

@MainActor class HomeViewModel: ObservableObject {
    @Published var uiState: HomeViewState = .empty

    func refresh() async {
        do {
            uiState = .loading
            try await loadUser()
        } catch {
            uiState = .error(error)
        }
    }

    private func loadUser() async throws {
        let getUser = GetUserUseCase()
        let user = try await getUser.invoke()
        uiState = .data(userEmailTitle: user.email)
    }
}
