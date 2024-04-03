//
//  PokemonApiImpl.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/4/24.
//

import PokemonAPI
import Foundation

public protocol PokemonApiImpl {
    func fetchPokedexEntries(with pokedexId: Int) async throws -> [PKMPokemonEntry]?
}
