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
    let pokemonApi: PokemonApiImpl
    var region: Region?
    
    var body: some View {
        PokemonGallery(pokemonApi: pokemonApi)
            .navigationTitle(region?.regionName ?? Region.kanto.regionName)
            .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    AppDetailColumn(pokemonApi: PokemonApi(), region: .kanto)
}
