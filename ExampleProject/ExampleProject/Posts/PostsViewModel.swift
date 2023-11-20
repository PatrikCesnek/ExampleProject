//
//  PostsViewModel.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 11/11/2023.
//

import Foundation

import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = [Post]()
    
    func getPosts(id: Int?) {
        Task {
            do {
                let postArray = try await ReadPostsUseCaseImpl(placeholderRepository: PlaceholderRepositoryImpl()).execute(id: nil) { result in
                    switch result {
                    case .success(let items):
                        self.handleFetchedData(items)
                    case .failure:
                        print("Could not get the data")
                    }
                }
                print(postArray)
            } catch {
                print("There was some error")
            }
        }
    }
    
    private func handleFetchedData(_ posts: [Post]) {
        var tempPosts = [Post]()
        DispatchQueue.global().async {
            for item in posts {
                tempPosts.append(item)
            }
        }
        
        self.posts = tempPosts
    }
}
