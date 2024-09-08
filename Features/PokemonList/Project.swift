//
//  Project.swift
//  AppManifests
//
//  Created by Kyeongmo Yang on 9/7/24.
//

import ProjectDescription

let projectName = "PokemonList"
let moduleBaseBundleId = "com.gaeng2y.Pokedex.PokemonList"
let baseInfoPlist: InfoPlist = .extendingDefault(
    with: [
        "CFBundleExecutable": "$(EXECUTABLE_NAME)",
        "CFBundleInfoDictionaryVersion": "0.1.0",
        "CFBundlePackageType": "APPL",
        "CFBundleName": "$(PRODUCT_NAME)",
        "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
        "CFBundleVersion": "1",
        "CFBundleShortVersionString": "0.1.0",
        "UILaunchStoryboardName": "LaunchScreen",
        "UISupportedInterfaceOrientations": "UIInterfaceOrientationPortrait"
    ]
)

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
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: moduleBaseBundleId,
            deploymentTargets: .multiplatform(iOS: "17.0", macOS: "14.0"),
            infoPlist: baseInfoPlist,
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
            destinations: [.iPhone, .iPad, .mac],
            product: .framework,
            bundleId: "\(moduleBaseBundleId).interface",
            deploymentTargets: .multiplatform(iOS: "17.0", macOS: "14.0"),
            infoPlist: baseInfoPlist,
            sources: ["Interface/**"],
            dependencies: []
        ),
        .target(
            name: "\(projectName)Tests",
            destinations: [.iPhone, .iPad, .mac],
            product: .unitTests,
            bundleId: "\(moduleBaseBundleId).tests",
            deploymentTargets: .multiplatform(iOS: "17.0", macOS: "14.0"),
            infoPlist: baseInfoPlist,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: projectName),
                .xctest
            ]
        ),
        .target(
            name: "\(projectName)Demo",
            destinations: [.iPhone, .iPad, .mac],
            product: .app,
            bundleId: "\(moduleBaseBundleId).Demo",
            deploymentTargets: .multiplatform(iOS: "17.0", macOS: "14.0"),
            infoPlist: baseInfoPlist,
            sources: ["Demo/Sources/**"],
            dependencies: [
                .target(name: projectName)
            ]
        )
    ],
    schemes: [],
    resourceSynthesizers: [.assets()]
)
