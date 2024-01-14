//
//  PlaceholderAPI.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 09/11/2023.
//

import Foundation

enum PlaceholderAPI {
    case read
    case post
    case delete
    case put
}

extension PlaceholderAPI {
    public var baseURLString: String {
        "https://jsonplaceholder.typicode.com/"
    }
    
    public var postsPath: String {
        "posts"
    }
    
    public var commentsPath: String {
        "comments/"
    }
    
}
