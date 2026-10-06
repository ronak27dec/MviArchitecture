//
//  PostEffect.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

final class PostEffect {
    private let api: PostAPIProtocol
    
    init(api: PostAPIProtocol) {
        self.api = api
    }
    
    func handle(intent: PostIntent) async -> PostIntent? {
        switch intent {
            case .loadPosts:
                do {
                    let posts = try await api.fetchPosts()
                    return .postsLoaded(posts)
                } catch {
                    return .postsFailed(error.localizedDescription)
                }
            default:
                return nil
        }
    }
}
