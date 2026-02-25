//
//  PokemonSpecies.swift
//  Pokemon
//
//  Created by Carlos Baranda on 24/02/26.
//


import Foundation

struct PokemonSpecies: Codable {
    let flavor_text_entries: [FlavorText]
}

struct FlavorText: Codable {
    let flavor_text: String
    let language: Language
}

struct Language: Codable {
    let name: String
}