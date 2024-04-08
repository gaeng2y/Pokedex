//
//  PokemonGrid.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/8/24.
//

import PokemonAPI
import SwiftUI

struct PokemonGrid: View {
    @State var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>] = []
    let pokemonApi: PokemonApiImpl
    
    var gridItems: [GridItem] {
        [GridItem(.adaptive(minimum: 100), spacing: 20, alignment: .top)]
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(pokemonSpecies, id: \.name) { pokemonSpecies in
                if let name = pokemonSpecies.name {
                    Text(name)
                }
            }
        }
        .padding()
        .task {
            await fetchPokemon()
        }
    }
    
    private func fetchPokemon() async {
        // 1로 entries count 가져와서 species 로 이름 가져오기
        do {
            let pokedex = try await pokemonApi.fetchPokedex(with: 2)
            guard let pokemonEntries = pokedex.pokemonEntries else {
                return
            }
            print(pokedex.region?.name)
            pokemonSpecies = pokemonEntries.compactMap { $0.pokemonSpecies }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    GeometryReader { geometryProxy in
        ScrollView {
            PokemonGrid(pokemonApi: PokemonApi())
        }
    }
}
