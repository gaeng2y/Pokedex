//
//  Logger+\.swift
//  Utils
//
//  Created by Kyeongmo Yang on 11/28/24.
//

import Foundation

public extension Logger {
    static func ui(_ message: Any, _ arguments: Any...) {
        log(message, arguments, level: .ui)
    }
    
    static func debug(_ message: Any, _ arguments: Any...) {
        log(message, arguments, level: .debug)
    }
    
    static func info(_ message: Any, _ arguments: Any...) {
        log(message, arguments, level: .info)
    }
    
    static func network(_ message: Any, _ arguments: Any...) {
        log(message, arguments, level: .network)
    }
    
    static func error(_ message: Any, _ arguments: Any...) {
        log(message, arguments, level: .network)
    }
    
    static func custom(category: String, _ message: Any, _ arguments: Any...) {
        log(message, arguments, level: .custom(categoryName: category))
    }
}
