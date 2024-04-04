//
//  DetailColumn.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/1/24.
//

import PokedexKit
import PokemonAPI
import SwiftUI

struct AppDetailColumn: View {
    @State var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>] = []
    let pokemonApi: PokemonApiImpl
    var region: Region?
    
    var gridItems: [GridItem] {
        [GridItem(.adaptive(minimum: 100), spacing: 20, alignment: .top)]
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(pokemonSpecies, id: \.name) { pokemonSpecie in
                Text(pokemonSpecie.name ?? "")
            }
        }
        .task {
            await fetchPokemon()
        }
        .navigationTitle(region?.regionName ?? Region.kanto.regionName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func fetchPokemon() async {
        // 1로 entries count 가져와서 species 로 이름 가져오기
        do {
            guard let pokemonEntries = try await pokemonApi.fetchPokedexEntries(with: 1) else {
                return
            }
            pokemonSpecies = pokemonEntries.compactMap { $0.pokemonSpecies }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    AppDetailColumn(pokemonApi: PokemonApi(), region: .kanto)
}
