//
//  Character.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 09/02/22.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let created: String
}

struct Location: Codable {
    let name: String
}

struct Origin: Codable {
    let name: String
}
