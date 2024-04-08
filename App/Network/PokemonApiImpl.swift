//
//  PokemonApiImpl.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/4/24.
//

import PokemonAPI
import Foundation

public protocol PokemonApiImpl {
    func fetchPokedex(with pokedexId: Int) async throws -> PKMPokedex
}
