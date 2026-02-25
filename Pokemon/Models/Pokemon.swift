//
//  PokemonResponse.swift
//  Pokemon
//
//  Created by Carlos Baranda on 24/02/26.
//


import Foundation

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable {
    let name: String
    let url: String
    var id: String { url }
}