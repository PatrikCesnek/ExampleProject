//
//  Comments.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 14/01/2024.
//

import Foundation

public struct Comments: Codable {
    var comments: [Comment]
}

public struct Comment: Codable, Identifiable {
    public var postId: Int
    public var id: Int
    public var name: String
    public var email: String
    public var body: String
}
