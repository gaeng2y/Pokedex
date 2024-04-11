//
//  PokemonGallery.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/8/24.
//

import PokedexKit
import SwiftUI

struct PokemonGallery: View {
    let pokemonApi: PokemonApiImpl
    let region: Region
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView {
                PokemonGrid(pokemonApi: pokemonApi, region: region)
            }
        }
    }
}

#Preview {
    PokemonGallery(pokemonApi: PokemonApi(), region: .kanto)
}
