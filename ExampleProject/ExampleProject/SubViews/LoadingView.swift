//
//  LoadingView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 11/01/2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
 
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}

#Preview {
    LoadingView()
}
