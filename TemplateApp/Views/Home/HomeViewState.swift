//
//  HomeViewState.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import Foundation

enum HomeViewState {
    case data(userEmailTitle: String?)
    case loading
    case error(Error)
    case empty
}
