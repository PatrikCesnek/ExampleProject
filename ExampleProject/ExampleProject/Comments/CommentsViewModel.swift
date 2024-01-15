//
//  CommentsViewModel.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 14/01/2024.
//

import Foundation
import SwiftUI

class CommentsViewModel: ObservableObject {
    @Published var comments: [Comment] = [Comment]()
    @Published var isLoading = true
    
    func getComments(id: Int?) {
        let commentArray = ReadCommentsUseCaseImpl(placeholderRepository: PlaceholderRepositoryImpl()).execute(id: nil) { result in
            switch result {
            case .success(let items):
                self.handleFetchedData(items)
            case .failure:
                print("Could not get the data")
            }
        }
        print(commentArray)
    }
    
    private func handleFetchedData(_ comments: [Comment]) {
        var tempComments = [Comment]()
        DispatchQueue.main.async {
            for item in comments {
                tempComments.append(item)
            }
            self.comments = tempComments
            self.isLoading = false
        }
    }
}
