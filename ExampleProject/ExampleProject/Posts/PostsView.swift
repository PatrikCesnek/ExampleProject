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
            if !viewModel.isLoading {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.posts, id: \.id) { item in
                            NavigationLink {
                                PostView(post: item)
                            } label: {
                                Text(item.title)
                                    .multilineTextAlignment(.leading)
                            }
                            
                        }
                    }
                    .padding()
                }
            } else if viewModel.err == nil {
                LoadingView()
            } else {
                ErrorView(
                    error: viewModel.err,
                    tryAgain: {
                        print("Error with posts")
                    }
                )
            }
        }
        .onAppear {
            viewModel.getPosts(id: nil, completion: {_,_ in})
        }
    }
}

#Preview {
    PostsView()
}
