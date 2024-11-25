//
//  DependencyContainor.swift
//  DependencyInjection
//
//  Created by Kyeongmo Yang on 11/25/24.
//

import Foundation

import ComposableArchitecture
import Utils

public final class DependencyContainor {
    
}

// MARK: - Testable Values
extension DependencyContainor: TestDependencyKey {
    public static var testValue: DependencyContainor {
        .init()
    }
}
