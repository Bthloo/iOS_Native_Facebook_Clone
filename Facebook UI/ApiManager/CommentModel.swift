// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let commentModel = try? JSONDecoder().decode(CommentModel.self, from: jsonData)

import Foundation

// MARK: - CommentModel
struct CommentModel: Codable {
    let comments: [Comment]
    let total, skip, limit: Int
}

// MARK: - Comment
struct Comment: Codable {
    let id: Int
    let body: String
    let postID, likes: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id, body
        case postID = "postId"
        case likes, user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username, fullName: String
}

