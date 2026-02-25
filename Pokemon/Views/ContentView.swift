//
//  ContentView.swift
//  Pokemon
//
//  Created by Carlos Baranda on 24/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pokemons: [Pokemon] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            
            Group {
                if isLoading {
                    ProgressView("Loading Pokémon...")
                }
                else if let error = errorMessage {
                    VStack(spacing: 12) {
                        Text(error)
                            .foregroundColor(.red)
                        
                        Button("Retry") {
                            fetchPokemon()
                        }
                    }
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(pokemons) { pokemon in
                                
                                NavigationLink {
                                    DetailView(pokemon: pokemon)
                                } label: {
                                    PokemonCardView(pokemon: pokemon)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationTitle("Pokédex")
        }
        .onAppear {
            fetchPokemon()
        }
    }
    
    // MARK: - Fetch Function
    func fetchPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                isLoading = false
            }
            
            if error != nil {
                DispatchQueue.main.async {
                    errorMessage = "No internet connection."
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    errorMessage = "Invalid server response."
                }
                return
            }
            
            if let decoded = try? JSONDecoder().decode(PokemonResponse.self, from: data) {
                DispatchQueue.main.async {
                    pokemons = decoded.results
                }
            } else {
                DispatchQueue.main.async {
                    errorMessage = "Failed to load data."
                }
            }
            
        }.resume()
    }
}
#Preview {
    ContentView()
}
