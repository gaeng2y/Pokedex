//
//  Pokemon.swift
//  Networking
//
//  Created by Kyeongmo Yang on 11/11/24.
//

import Foundation

public struct Pokemon: Identifiable {
    public let id: Int?
    public let name: String?
    public let spriteUrl: String?
    
    public init(id: Int?, name: String?, spriteUrl: String?) {
        self.id = id
        self.name = name
        self.spriteUrl = spriteUrl
    }
}
