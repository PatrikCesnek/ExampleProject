//
//  ErrorView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 08/02/2024.
//

import SwiftUI

struct ErrorView: View {
    let error: Error?
    let tryAgain: () -> Void
    
    var body: some View {
        VStack {
            Text(error?.localizedDescription ?? "Ooops something went wrong")
            Button("Try again") {
                tryAgain()
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
}

#Preview {
    ErrorView(error: nil, tryAgain: {})
}
