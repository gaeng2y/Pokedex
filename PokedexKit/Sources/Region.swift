// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

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
        let region: String.LocalizationValue = switch self {
        case .kanto: "Kanto"
        case .johto: "Johto"
        case .hoenn: "Hoenn"
        case .sinnoh: "Sinnoh"
        case .unova: "Unova"
        case .kalos: "Kalos"
        case .alola: "Alola"
        case .galar: "Galar"
        case .paldea: "Paldea"
        }
        
        return String(localized: region, bundle: .module)
    }
}

public extension Region {
    @ViewBuilder
    var label: some View {
        Text(self.regionName)
    }
}
