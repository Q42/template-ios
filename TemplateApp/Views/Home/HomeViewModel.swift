//
//  HomeViewModel.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

@Observable
class HomeViewModel {
    var state: HomeViewState = .empty

    func refresh() async {
        do {
            state = .loading
            try await loadUser()
        } catch {
            state = .error(error)
        }
    }

    private func loadUser() async throws {
        let getUser = GetUserUseCase()
        let user = try await getUser.invoke()
        state = .data(userEmailTitle: user.email)
    }
}
