//
//  SomeItem.swift
//  TemplateApp
//
//  Created by Marcel Bloemendaal on 18/04/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import Foundation

struct ExampleItem {
    let title: String
}

extension ExampleItem : Identifiable, Hashable {
    var id: String { title }
}

extension ExampleItem {
    static var example: ExampleItem { ExampleItem(title: "Hello, World!") }
}
