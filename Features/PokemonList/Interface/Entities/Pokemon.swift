//
//  Pokemon.swift
//  PokemonListInterface
//
//  Created by Kyeongmo Yang on 9/12/24.
//

import Foundation

public struct Pokemon: Identifiable, Equatable, Hashable {
    public let id: Int
    public let name: String
    let frontDefaultStripe: String
    
    public var stripeUrl: URL? {
        URL(string: frontDefaultStripe)
    }
}
