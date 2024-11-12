//
//  EndPoint.swift
//  Utils
//
//  Created by Kyeongmo Yang on 9/14/24.
//

import Foundation
import HTTPTypes

public enum EndPoint {
    private static let scheme: String = "https"
    private static let host: String = "pokeapi.co"
    private static let pathPrefix: String = "/api/v2"
    
    case fetchGeneration(Int)
    
    private var path: String {
        switch self {
        case let .fetchGeneration(generationId):
            "/generation/\(generationId)/"
        }
    }
    
    public var request: HTTPRequest {
        switch self {
        case let .fetchGeneration(generation):
            return HTTPRequest(
                method: .get,
                scheme: type(of: self).scheme,
                authority: type(of: self).host,
                path: type(of: self).pathPrefix + path
            )
        }
    }
}
