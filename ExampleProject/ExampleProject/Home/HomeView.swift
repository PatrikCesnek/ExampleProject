//
//  ContentView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 07/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HomeContentView()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
