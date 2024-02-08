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
    var err: Error? = nil
    
    func getComments(id: Int?, completion: @escaping ([Comment]?, Error?) -> Void) {
        ReadCommentsUseCaseImpl(placeholderRepository: PlaceholderRepositoryImpl()).execute(id: id) { result in
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
