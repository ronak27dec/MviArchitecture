//
//  PostReducer.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

func postReducer(state: PostState, intent: PostIntent) -> PostState {
    var newState = state
    
    switch intent {
        case .loadPosts:
            newState.isLoading = true
            newState.error = nil
            
        case .postsLoaded(let posts):
            newState.isLoading = false
            newState.posts = posts
            
        case .postsFailed(let error):
            newState.isLoading = false
            newState.error = error
            
        case .selectPost(let post):
            newState.selectedPost = post
    }
    
    return newState
}
