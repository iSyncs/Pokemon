import SwiftUI

struct PokemonCardView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.name.capitalized)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(12)
    }
}