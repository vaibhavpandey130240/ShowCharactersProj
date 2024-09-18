//
//  CHCharactersModel.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let info: Info?
    let results: [CHResult]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - CHResult
struct CHResult: Codable {
    let id: Int?
    let name: String?
    let status: Status?
    let species, type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
