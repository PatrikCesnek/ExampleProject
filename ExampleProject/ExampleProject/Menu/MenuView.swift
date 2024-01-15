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
        List {
            NavigationLink(
                destination: { PostsView(viewModel: PostsViewModel()) },
                label: { Text("Posts")}
            )
            
            NavigationLink(
                destination: { CommentsView(viewModel: CommentsViewModel()) },
                label: { Text("Comments")}
            )

            NavigationLink(
                destination: { PostsView(viewModel: PostsViewModel()) },
                label: { Text("Albums")}
            )
            
            NavigationLink(
                destination: { PostsView(viewModel: PostsViewModel()) },
                label: { Text("Photos")}
            )
            
            NavigationLink(
                destination: { PostsView(viewModel: PostsViewModel()) },
                label: { Text("Todos")}
            )

            NavigationLink(
                destination: { PostsView(viewModel: PostsViewModel()) },
                label: { Text("Users")}
            )
        }
        .navigationTitle(Text("Menu"))
    }
}

#Preview {
    MenuView()
}
