//
//  MenuViewModel.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 09/11/2023.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var types: [String] = ["Posts", "Comments", "Albums", "Photos", "Todos", "Users"]
}
