//
//  PostDetailView.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import SwiftUI

struct PostDetailView: View {
    let post: PostModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(post.title)
                .font(.title)
                .bold()
            
            Text(post.body)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
    }
}
