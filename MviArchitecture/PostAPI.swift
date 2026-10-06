//
//  PostAPI.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

protocol PostAPIProtocol {
    func fetchPosts() async throws -> [PostModel]
}

final class PostAPI: PostAPIProtocol {
    func fetchPosts() async throws -> [PostModel] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([PostModel].self, from: data)
    }
}
