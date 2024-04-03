//
//  PokemonApi.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/4/24.
//

import PokemonAPI
import Foundation

public struct PokemonApi: PokemonApiImpl {
    public func fetchPokedexEntries(with pokedexId: Int) async throws -> [PKMPokemonEntry]? {
        let pokedex = try await PokemonAPI().gameService.fetchPokedex(pokedexId)
        return pokedex.pokemonEntries
    }
}
