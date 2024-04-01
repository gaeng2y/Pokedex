// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public enum Region: Codable, Hashable, Identifiable, CaseIterable {
    case kanto
    case johto
    case hoenn
    case sinnoh
    case hisui
    case unova
    case kalos
    case alola
    case galar
    case paldea
    case kitakami
    
    public var id: Region { self }
}

public extension Region {
    @ViewBuilder
    var label: some View {
        switch self {
        case .kanto: Text("kanto")
        case .johto: Text("johto")
        case .hoenn: Text("hoenn")
        case .sinnoh: Text("sinnoh")
        case .hisui: Text("hisui")
        case .unova: Text("unova")
        case .kalos: Text("kalos")
        case .alola: Text("alola")
        case .galar: Text("galar")
        case .paldea: Text("paldea")
        case .kitakami: Text("kitakami")
        }
    }
}
