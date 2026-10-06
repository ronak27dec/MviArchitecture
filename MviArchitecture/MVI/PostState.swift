//
//  PostState.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

struct PostState {
    var isLoading: Bool = false
    var posts: [PostModel] = []
    var error: String?
    var selectedPost: PostModel?
}
