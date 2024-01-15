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
                    VStack(alignment: .leading, spacing: 12) {
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
            } else {
                LoadingView()
            }
        }
        .onAppear {
            viewModel.getComments(id: nil)
        }
    }
}

#Preview {
    CommentsView(viewModel: CommentsViewModel())
}
