//
//  MenuView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 09/11/2023.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel = MenuViewModel()

    var body: some View {
        List(0 ..< viewModel.types.count) { index in
            NavigationLink(
                destination: { PostsView(viewModel: PostsViewModel()) },
                label: { Text("\(viewModel.types[index])") }
            )
        }
        .navigationTitle(Text("Menu"))
    }
}

#Preview {
    MenuView()
}
