//
//  CommentView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 15/01/2024.
//

import SwiftUI

struct CommentView: View {
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(comment.body)
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CommentView(comment: Comment(postId: 0, id: 0, name: "Lorem", email: "mail", body: "Lorem ipsum"))
}
