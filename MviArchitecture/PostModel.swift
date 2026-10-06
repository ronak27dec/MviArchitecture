//
//  PostModel.swift
//  MviArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

struct PostModel: Identifiable, Codable, Equatable, Hashable {
    let id: Int
    let title: String
    let body: String
}
