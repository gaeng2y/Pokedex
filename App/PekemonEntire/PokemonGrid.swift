//
//  PokemonGrid.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/8/24.
//

import PokedexKit
import PokemonAPI
import SwiftUI

struct PokemonGrid: View {
    @State var pokemonIds: [Int] = []
    let pokemonApi: PokemonApiImpl
    let region: Region
    
    var gridItems: [GridItem] {
        [GridItem(.adaptive(minimum: 100), spacing: 20, alignment: .top)]
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(pokemonIds, id: \.self) { id in
                PokemonView(pokemonId: id, pokemonApi: pokemonApi)
            }
        }
        .padding()
        .task {
            await fetchPokemon()
        }
    }
}

extension PokemonGrid {
    private func fetchPokemon() async {
        // 1로 entries count 가져와서 species 로 이름 가져오기
        do {
            let pokedex = try await pokemonApi.fetchPokedex(with: region.id)
            guard let pokemonEntries = pokedex.pokemonEntries else {
                return
            }
            pokemonIds = pokemonEntries
                .compactMap { $0.pokemonSpecies }
                .compactMap { $0.url }
                .compactMap { $0.components(separatedBy: "/").dropLast().last }
                .compactMap { Int($0) }
        } catch {
        }
    }
}

#Preview {
    GeometryReader { geometryProxy in
        ScrollView {
            PokemonGrid(pokemonApi: PokemonApi(), region: .alola)
        }
    }
}
