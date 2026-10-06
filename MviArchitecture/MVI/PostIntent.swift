//
//  PostIntent.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

enum PostIntent {
    case loadPosts
    case postsLoaded([PostModel])
    case postsFailed(String)
    case selectPost(PostModel)
}
