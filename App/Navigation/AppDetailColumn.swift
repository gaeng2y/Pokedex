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
    var region: Region? = .kanto
    
    var body: some View {
        if let region {
            PokemonGallery(pokemonApi: pokemonApi, region: region)
                .navigationTitle(region.regionName)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AppDetailColumn(pokemonApi: PokemonApi(), region: .kanto)
}
