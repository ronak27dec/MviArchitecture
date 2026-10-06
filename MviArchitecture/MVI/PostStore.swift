//
//  PostStore.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation
import Combine

@MainActor
final class PostStore: ObservableObject {
    
    @Published private(set) var state = PostState()
    
    private let reducer: (PostState, PostIntent) -> PostState
    private let effect: PostEffect
    
    init(
        initialState: PostState = PostState(),
        reducer: @escaping (PostState, PostIntent) -> PostState,
        effect: PostEffect
    ) {
        self.state = initialState
        self.reducer = reducer
        self.effect = effect
    }
    
    func send(_ intent: PostIntent) {
        // 1. Reduce synchronously
        state = reducer(state, intent)
        
        // 2. Run side effects
        Task {
            if let nextIntent = await effect.handle(intent: intent) {
                send(nextIntent)
            }
        }
    }
}
