//
//  DependencyValues.swift
//  DependencyInjection
//
//  Created by Kyeongmo Yang on 11/25/24.
//

import Dependencies

extension DependencyValues {
    public var containor: DependencyContainor {
        get { self[DependencyContainor.self] }
        set { self[DependencyContainor.self] = newValue }
    }
}
