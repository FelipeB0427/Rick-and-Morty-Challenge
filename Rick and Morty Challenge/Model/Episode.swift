//
//  Episode.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import Foundation

struct Episodes: Codable {
    var info: Info
    var results: [Results]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Results: Codable {
    let id: Int
    let name: String
    let airDate: String
    let characters: [String]
    let episodeCode: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case airDate = "air_date"
        case episodeCode = "episode"
        case characters = "characters"
        case createdAt = "created"
    }
}
