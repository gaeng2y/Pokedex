//
//  PokemonApiService.swift
//  Networking
//
//  Created by Kyeongmo Yang on 11/11/24.
//

import Foundation

public protocol PokemonApiService {
    func fetchPokemons(with id: Int) async throws -> [Pokemon]
}
