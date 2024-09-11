//
//  Project.swift
//  AppManifests
//
//  Created by Kyeongmo Yang on 9/7/24.
//

import ProjectDescription

let projectName = "PokemonList"
let moduleBaseBundleId = "com.gaeng2y.Pokedex.PokemonList"

let project = Project(
    name: "PokemonList",
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
            resources: ["../../Resources/**"],
            dependencies: [
                .target(name: "\(projectName)Interface"),
                .project(target: "Components",  path: .relativeToRoot("DesignSystem/Components")),
                .project(target: "Utils",  path: .relativeToRoot("Share/Utils")),
                .project(target: "DependencyInjection",  path: .relativeToRoot("DependencyInjection")),
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
        .target(
            name: "\(projectName)Demo",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "\(moduleBaseBundleId).Demo",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Demo/Sources/**"],
            dependencies: [
                .target(name: projectName)
            ]
        )
    ],
    schemes: [],
    resourceSynthesizers: [.assets()]
)
