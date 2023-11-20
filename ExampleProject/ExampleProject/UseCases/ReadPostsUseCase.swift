//
//  ReadPostsUseCase.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 10/11/2023.
//

import Foundation

public protocol ReadPostsUseCase {
    func execute(id: Int?, completion: @escaping (Result<[Post], Error>) -> Void) async throws
}

public struct ReadPostsUseCaseImpl: ReadPostsUseCase {
    let placeholderRepository: PlaceholderRepositoryImpl
    
    init(placeholderRepository: PlaceholderRepositoryImpl) {
        self.placeholderRepository = placeholderRepository
    }
    
    public func execute(id: Int?, completion: @escaping (Result<[Post], Error>) -> Void) async throws {
        try await placeholderRepository.read(id: id, completion: completion)
    }
}
