//
//  DetailView.swift
//  Pokemon
//
//  Created by Carlos Baranda on 24/02/26.
//

import SwiftUI

struct DetailView: View {
    
    let pokemon: Pokemon
    
    @State private var description: String = ""
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            
            Text(pokemon.name.capitalized)
                .font(.largeTitle)
                .bold()
            
            Text("#\(pokemon.pokemonID)")
                .foregroundColor(.gray)
            
            Divider()
            
            if isLoading {
                ProgressView()
            } else {
                Text(description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchDescription()
        }
    }
    
    func fetchDescription() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(pokemon.pokemonID)") else { return }
        
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                isLoading = false
            }
            
            guard let data = data else { return }
            
            if let decoded = try? JSONDecoder().decode(PokemonSpecies.self, from: data) {
                
                if let entry = decoded.flavor_text_entries.first(where: { $0.language.name == "en" }) {
                    
                    let cleanText = entry.flavor_text
                        .replacingOccurrences(of: "\n", with: " ")
                        .replacingOccurrences(of: "\u{000C}", with: " ")
                    
                    DispatchQueue.main.async {
                        description = cleanText
                    }
                }
            }
            
        }.resume()
    }
}
