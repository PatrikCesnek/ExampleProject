//
//  HomeContentView.swift
//  ExampleProject
//
//  Created by Patrik Cesnek on 07/11/2023.
//

import SwiftUI

struct HomeContentView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .padding(.bottom, 10)
                
                Text("This is a small project made for showing my core skills as an iOS Developer.")
                
                Text("All data in this app will be dummy data downloaded from placeholder APIs so please do not mind what it says.")
                
                Text("I hope you'll have pleasant experiance looking at the code and app itself. 🤗")
            }
            .font(.caption)
            
            Spacer()
            
            NavigationLink("Proceed", destination: Text("New View"))
                .font(.subheadline)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    HomeContentView()
}
