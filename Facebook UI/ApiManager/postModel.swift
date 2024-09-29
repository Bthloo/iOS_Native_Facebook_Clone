// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postModel = try? JSONDecoder().decode(PostModel.self, from: jsonData)

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}

// MARK: - Post
struct Post: Codable {
    let id: Int
    var isLiked = false
    let title, body: String
    let tags: [String]
    var reactions: Reactions
    let views, userID: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body, tags, reactions, views
        case userID = "userId"
    }
}

// MARK: - Reactions
struct Reactions: Codable {
    var likes: Int
    var dislikes: Int
}

