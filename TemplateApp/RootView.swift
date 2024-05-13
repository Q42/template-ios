//
//  RootView.swift
//  TemplateApp
//
//  Copyright © 2024 Q42. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("RootView")
    }
}

#Preview {
    RootView()
}
