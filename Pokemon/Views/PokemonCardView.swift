//
//  PokemonCardView.swift
//  Pokemon
//
//  Created by Carlos Baranda on 24/02/26.
//


import SwiftUI

struct PokemonCardView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack(spacing: 16) {
            
            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            
            Text(pokemon.name.capitalized)
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(12)
    }
}
