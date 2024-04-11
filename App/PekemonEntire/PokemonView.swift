//
//  PokemonView.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/9/24.
//

import Kingfisher
import PokedexKit
import PokemonAPI
import SwiftUI

struct PokemonView: View {
    let pokemonId: Int
    let pokemonApi: PokemonApiImpl
    @State private var pokemon: Pokemon?
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemon?.stripeUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                Color.clear
            }
            Text(pokemon?.name ?? "")
        }
        .task {
            await fetchPokemon()
        }
    }
    
    private func fetchPokemon() async {
        do {
            let pkmPokemon = try await pokemonApi.fetchPokemon(with: pokemonId)
            let pokemonSpecies = try await pokemonApi.fetchPokemonSpecies(with: pokemonId)
            let languageCode = Locale.current.identifier.components(separatedBy: "_").first
            if let pokemonName = pokemonSpecies.names?.filter({ $0.language?.name == languageCode }).first?.name,
               let frontDefaultSprite = pkmPokemon.sprites?.frontDefault {
                pokemon = Pokemon(id: pokemonId, name: pokemonName, frontDefaultStripe: frontDefaultSprite)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    PokemonView(pokemonId: 1, pokemonApi: PokemonApi())
}
