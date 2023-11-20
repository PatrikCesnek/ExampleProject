//
//  Posts.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 11/11/2023.
//

import Foundation

public struct Posts: Codable {
    var posts: [Post]
}

public struct Post: Codable, Identifiable {
    public var userId: Int
    public var id: Int
    public var title: String
    public var body: String
}
