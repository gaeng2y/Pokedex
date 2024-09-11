//
//  PokemonListFetch.swift
//  PokemonListInterface
//
//  Created by Kyeongmo Yang on 9/12/24.
//

import Foundation

public protocol PokemonListFetch {
    func fetchPokemons(with regionId: Int) -> [Pokemon]
}
