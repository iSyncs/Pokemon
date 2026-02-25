//
//  Pokemon.swift
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
    
    var pokemonID: String {
        url.split(separator: "/").last { !$0.isEmpty }.map(String.init) ?? ""
    }
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
    }
}
