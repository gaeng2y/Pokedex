//
//  PokemonApiServiceImpl.swift
//  Networking
//
//  Created by Kyeongmo Yang on 11/11/24.
//

import Foundation
import NetworkingInterface
import PokemonAPI

public enum PokemonApiError: Error {
    case emptyEntries
}

public final class PokemonApiServiceImpl: PokemonApiService {
    private let pokemonApi = PokemonAPI(session: .shared)
    
    public func fetchPokemons(with id: Int) async throws -> [Pokemon] {
        guard let pokemonEntires = try await fetchPokedex(with: id) else {
            throw PokemonApiError.emptyEntries
        }
        
        let entryNumbers = pokemonEntires.compactMap(\.entryNumber)
        var species: [PKMPokemon] = []
        for entryNumber in entryNumbers {
            species.append(try await fetchPokemonSpecie(with: entryNumber))
        }
        
        return species.map {
            Pokemon(id: $0.id, name: $0.name, spriteUrl: $0.sprites?.frontDefault)
        }
    }
    
    private func fetchPokedex(with id: Int) async throws -> [PKMPokemonEntry]? {
        try await pokemonApi.gameService.fetchPokedex(id).pokemonEntries
    }
    
    private func fetchPokemonSpecie(with entryNumber: Int) async throws -> PKMPokemon {
        try await pokemonApi.pokemonService.fetchPokemon(entryNumber)
    }
}
