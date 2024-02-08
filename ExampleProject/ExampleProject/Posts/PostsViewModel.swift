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
    @Published var isLoading = true
    var err: Error? = nil
    
    func getPosts(id: Int?, completion: @escaping ([Post]?, Error?) -> Void) {
        let postArray = try ReadPostsUseCaseImpl(placeholderRepository: PlaceholderRepositoryImpl()).execute(id: nil) { result in
            switch result {
            case .success(let items):
                self.handleFetchedData(items)
                completion(items, nil)
            case .failure(let error):
                self.err = error
                print("Could not get the data: \(error)")
                completion(nil, error)
            }
        }
    }
    
    private func handleFetchedData(_ posts: [Post]) {
        var tempPosts = [Post]()
        DispatchQueue.main.async {
            for item in posts {
                tempPosts.append(item)
            }
            self.posts = tempPosts
            self.isLoading = false
        }
    }
}
