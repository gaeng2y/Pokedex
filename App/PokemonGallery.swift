//
//  PokemonGallery.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/8/24.
//

import SwiftUI

struct PokemonGallery: View {
    @State private var searchText = ""
    let pokemonApi: PokemonApiImpl
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView {
                PokemonGrid(pokemonApi: pokemonApi)
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    PokemonGallery(pokemonApi: PokemonApi())
}
