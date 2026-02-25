//
//  DetailView.swift
//  Pokemon
//
//  Created by Carlos Baranda on 24/02/26.
//


import SwiftUI

struct DetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: 20) {
            Text(pokemon.name.capitalized)
                .font(.largeTitle)
                .bold()
            
            Text(pokemon.url)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}