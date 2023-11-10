//
//  ReadPostsUseCase.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 10/11/2023.
//

import Foundation

public protocol ReadPostsUseCase {
    func execute(id: Int?)
}

public struct ReadPostsUseCaseImpl: ReadPostsUseCase {
    let placeholderRepository: PlaceholderRepository
    
    init(placeholderRepository: PlaceholderRepository) {
        self.placeholderRepository = placeholderRepository
    }
    
    public func execute(id: Int?) {
        placeholderRepository.read(id: id)
    }
}
