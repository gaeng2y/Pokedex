//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 11/5/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    private let pokemonApi: PokemonApiImpl = PokemonApi()
    var body: some Scene {
        WindowGroup {
            ContentView(pokemonApi: pokemonApi)
        }
    }
}
