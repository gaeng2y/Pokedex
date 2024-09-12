//
//  Region.swift
//  PokemonListInterface
//
//  Created by Kyeongmo Yang on 9/12/24.
//

import Foundation

public enum Region: Codable, Hashable, Identifiable, CaseIterable {
    case kanto
    case johto
    case hoenn
    case sinnoh
    case unova
    case kalos
    case alola
    case galar
    case paldea
    
    public var id: Int {
        switch self {
        case .kanto: 2
        case .johto: 3
        case .hoenn: 4
        case .sinnoh: 5
        case .unova: 8
        case .kalos: 12
        case .alola: 16
        case .galar: 27
        case .paldea: 31
        }
    }
    
    public var regionName: String {
        switch self {
        case .kanto: "관동"
        case .johto: "성도"
        case .hoenn: "호연"
        case .sinnoh: "신오"
        case .unova: "하나"
        case .kalos: "칼로스"
        case .alola: "알로라"
        case .galar: "가라르"
        case .paldea: "팔데아"
        }
    }
}
