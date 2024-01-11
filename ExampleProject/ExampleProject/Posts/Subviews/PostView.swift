//
//  PostView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 11/01/2024.
//

import SwiftUI

struct PostView: View {
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(post.body)
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PostView(post: Post(userId: 0, id: 0, title: "LOrem", body: "Lorem Ipsum"))
}
