// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profileModel = try? JSONDecoder().decode(ProfileModel.self, from: jsonData)

import Foundation

// MARK: - ProfileModel
struct ProfileModel: Codable {
    let id: Int?
    let firstName, lastName, maidenName: String?
    let age: Int?
    let gender, email, phone, username: String?
    let password, birthDate: String?
    let image: String?
    let bloodGroup: String?
    let height, weight: Double?
    let eyeColor: String?
    let hair: Hair?
    let ip: String?
    let address: Address?
    let macAddress, university: String?
    let bank: Bank?
    let company: Company?
    let ein, ssn, userAgent: String?
    let crypto: Crypto?
    let role: String?
    let message: String?
}

// MARK: - Address
struct Address: Codable {
    let address, city, state, stateCode: String?
    let postalCode: String?
    let coordinates: Coordinates?
    let country: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double?
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String?
    let iban: String?
}

// MARK: - Company
struct Company: Codable {
    let department, name, title: String?
    let address: Address?
}

// MARK: - Crypto
struct Crypto: Codable {
    let coin, wallet, network: String?
}

// MARK: - Hair
struct Hair: Codable {
    let color, type: String?
}
