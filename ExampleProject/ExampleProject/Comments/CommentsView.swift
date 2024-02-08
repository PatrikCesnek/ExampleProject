//
//  CommentsView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 14/01/2024.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel = CommentsViewModel()
    
    var body: some View {
        VStack {
            if !viewModel.isLoading {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.comments, id: \.id) { item in
                            NavigationLink {
                                CommentView(comment: item)
                            } label: {
                                Text(item.name)
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
                        print("Try again")
                    }
                )
            }
        }
        .onAppear {
            viewModel.getComments(id: nil, completion: {_,_ in })
        }
    }
}

#Preview {
    CommentsView(viewModel: CommentsViewModel())
}
