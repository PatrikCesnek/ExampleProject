//
//  PostsView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 11/11/2023.
//

import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel = PostsViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.posts, id: \.id) { item in
                Text(item.title)
            }
        }
        .onAppear {
            viewModel.getPosts(id: nil)
        }
    }
}

#Preview {
    PostsView()
}
