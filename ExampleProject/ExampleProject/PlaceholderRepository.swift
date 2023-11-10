//
//  PlaceholderRepository.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 10/11/2023.
//

import Foundation
import UIKit

protocol PlaceholderRepository {
    func read(id: Int?)
    func post()
    func delete(id: Int)
    func put(id: Int)
}

struct PlaceholderRepositoryImpl: PlaceholderRepository {
    let placeholderApi: PlaceholderAPI
    
    func read(id: Int?) {
        var urlString = placeholderApi.baseURL.path() + placeholderApi.postsPath
        if let id = id {
            urlString += "\(id)"
        }
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 40
    }
    
    func post() {
        let urlString = placeholderApi.baseURL.path() + placeholderApi.postsPath
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 40
    }
    
    func delete(id: Int) {
        let urlString = placeholderApi.baseURL.path() + placeholderApi.postsPath + "\(id)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.timeoutInterval = 40
    }
    
    func put(id: Int) {
        let urlString = placeholderApi.baseURL.path() + placeholderApi.postsPath + "\(id)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.timeoutInterval = 40
    }
    
    
}
