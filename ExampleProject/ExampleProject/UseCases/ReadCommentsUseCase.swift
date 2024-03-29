//
//  ReadCommentsUseCase.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 14/01/2024.
//

import Foundation

public protocol ReadCommentsUseCase {
    func execute(id: Int?, completion: @escaping (Result<[Comment], Error>) -> Void)
}

public struct ReadCommentsUseCaseImpl: ReadCommentsUseCase {
    let placeholderRepository: PlaceholderRepositoryImpl
    
    init(placeholderRepository: PlaceholderRepositoryImpl) {
        self.placeholderRepository = placeholderRepository
    }
    
    public func execute(id: Int?, completion: @escaping (Result<[Comment], Error>) -> Void) {
        placeholderRepository.readComments(id: id, completion: completion)
    }
}
