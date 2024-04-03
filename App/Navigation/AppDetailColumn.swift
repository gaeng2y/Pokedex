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
    @State var pokemonEntries: [PKMPokemonEntry]? = []
    let pokemonApi: PokemonApiImpl
    var region: Region?
    
    var body: some View {
        Text("테스트")
            .task {
                await fetchPokemon()
            }
            .navigationTitle(region?.regionName ?? Region.kanto.regionName)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private func fetchPokemon() async {
        // 1로 entries count 가져와서 species 로 이름 가져오기
        do {
            pokemonEntries = try await pokemonApi.fetchPokedexEntries(with: 1)
            print(pokemonEntries)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    AppDetailColumn(pokemonApi: PokemonApi(), region: .kanto)
}
