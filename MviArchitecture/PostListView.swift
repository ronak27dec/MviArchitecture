//
//  PostListView.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject private var store = PostStore(
        reducer: postReducer,
        effect: PostEffect(api: PostAPI())
    )
    
    var body: some View {
        NavigationStack {
            Group {
                if store.state.isLoading {
                    ProgressView()
                } else if let error = store.state.error {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    List(store.state.posts) { post in
                        Button {
                            store.send(.selectPost(post))
                        } label: {
                            Text(post.title)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationDestination(
                item: Binding(
                    get: { store.state.selectedPost },
                    set: { _ in }
                )
            ) { post in
                PostDetailView(post: post)
            }
        }
        .onAppear {
            store.send(.loadPosts)
        }
    }
}
