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
    
    public var id: Region { self }
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
