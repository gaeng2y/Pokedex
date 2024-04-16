//
//  File.swift
//  
//
//  Created by Kyeongmo Yang on 4/10/24.
//

import Foundation

public struct Pokemon: Identifiable {
    public let id: Int
    public let name: String
    let frontDefaultStripe: String
    
    public var stripeUrl: URL? {
        URL(string: frontDefaultStripe)
    }
    
    public init(id: Int, name: String, frontDefaultStripe: String) {
        self.id = id
        self.name = name
        self.frontDefaultStripe = frontDefaultStripe
    }
}
