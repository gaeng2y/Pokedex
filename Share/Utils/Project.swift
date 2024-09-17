//
//  Projects.swift
//  AppManifests
//
//  Created by Kyeongmo Yang on 9/9/24.
//

import ProjectDescription

let projectName = "Utils"
let moduleBaseBundleId = "com.gaeng2y.Pokedex.Utils"

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
            product: .framework,
            bundleId: moduleBaseBundleId,
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "HTTPTypes")
            ]
        )
    ],
    schemes: []
)
