//
//  PlaceholderRepository.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 10/11/2023.
//

import Foundation
import UIKit

protocol PlaceholderRepository {
    func read(id: Int?, completion: @escaping (Result<[Post], Error>) -> Void)
    func post()
    func delete(id: Int)
    func put(id: Int)
}

struct PlaceholderRepositoryImpl: PlaceholderRepository {
    let postsPath = PlaceholderAPI.post.postsPath
    let baseURL = PlaceholderAPI.post.baseURL
    
    func read(id: Int?, completion: @escaping (Result<[Post], Error>) -> Void) {
        var postsArray = [Post]()
        var urlString = baseURL.path() + postsPath
        if let id = id {
            urlString += "\(id)"
        }
//        guard let url = URL(string: urlString) else { return }
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 40
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network request error: \(error)")
                completion(.failure(error))
                return
            }
            
            do {
                guard let data = data else {
                    let noDataError = NSError(domain: "No data received", code: 0, userInfo: nil)
                    completion(.failure(noDataError))
                    return
                }
                
                let posts = try JSONDecoder().decode([Post].self, from: data)
                for postData in posts {
                    postsArray.append(postData)
                    print("Data: \(postsArray)")
                }
                completion(.success(posts))
            } catch {
                print("Data decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    func post() {
        let urlString = baseURL.path() + postsPath
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 40
    }
    
    func delete(id: Int) {
        let urlString = baseURL.path() + postsPath + "\(id)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.timeoutInterval = 40
    }
    
    func put(id: Int) {
        let urlString = baseURL.path() + postsPath + "\(id)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.timeoutInterval = 40
    }
    
    
}
