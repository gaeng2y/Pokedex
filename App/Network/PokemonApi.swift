//
//  PokemonApi.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/4/24.
//

import PokemonAPI
import Foundation

public struct PokemonApi: PokemonApiImpl {
    public func fetchPokedex(with pokedexId: Int) async throws -> PKMPokedex {
        try await PokemonAPI().gameService.fetchPokedex(pokedexId)
    }
}
