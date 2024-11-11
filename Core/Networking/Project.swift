//
//  Project.swift
//  AppManifests
//
//  Created by Kyeongmo Yang on 9/9/24.
//

import ProjectDescription

let projectName = "Networking"
let moduleBaseBundleId = "com.gaeng2y.Pokedex.Networking"

let project = Project(
    name: projectName,
    settings: .settings(
        configurations: [
            .debug(
                name: "Debug",
                settings: ["OTHER_SWIFT_FLAGS": SettingValue(stringLiteral: "-D LOG")],
                xcconfig: nil
            ),
            .release(
                name: "Release",
                settings: [:],
                xcconfig: nil
            ),
        ]
    ),
    targets: [
        .target(
            name: projectName,
            destinations: [.iPhone, .iPad],
            product: .staticFramework,
            bundleId: moduleBaseBundleId,
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .target(name: "\(projectName)Interface"),
                .project(target: "Utils",  path: .relativeToRoot("Share/Utils")),
                .external(name: "PokemonAPI")
            ]
        ),
        .target(
            name: "\(projectName)Interface",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "\(moduleBaseBundleId).interface",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Interface/**"],
            dependencies: []
        ),
        .target(
            name: "\(projectName)Tests",
            destinations: [.iPhone, .iPad],
            product: .unitTests,
            bundleId: "\(moduleBaseBundleId).tests",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: projectName),
                .xctest
            ]
        ),
    ],
    schemes: []
)
