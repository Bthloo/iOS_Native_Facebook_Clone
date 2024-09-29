// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? JSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let accessToken, refreshToken: String?
    let id: Int?
    let username, email, firstName, lastName: String?
    let gender: String?
    let image: String?
    let message: String?
}
