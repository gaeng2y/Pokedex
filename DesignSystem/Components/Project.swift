//
//  Project.swift
//  AppManifests
//
//  Created by Kyeongmo Yang on 9/9/24.
//

import ProjectDescription

let projectName = "Components"
let moduleBaseBundleId = "com.gaeng2y.Pokedex.Components"

let project = Project(
    name: projectName,
    targets: [
        .target(
            name: projectName,
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: moduleBaseBundleId,
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["../../Resources/**"],
            dependencies: [
                .project(target: "Utils",  path: .relativeToRoot("Share/Utils")),
            ]
        )
    ],
    schemes: [],
    resourceSynthesizers: [.assets()]
)
