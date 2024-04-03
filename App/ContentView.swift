//
//  ContentView.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 11/5/23.
//

import PokedexKit
import PokemonAPI
import SwiftUI

struct ContentView: View {
    @State private var selection: Region? = .kanto
    let pokemonApi: PokemonApiImpl
    
    var body: some View {
        // 나머지는 SplitView
        NavigationSplitView {
            AppSidebarList(selection: $selection)
        } detail: {
            AppDetailColumn(pokemonApi: pokemonApi, region: selection)
        }
    }
}

#Preview {
    ContentView(pokemonApi: PokemonApi())
}
