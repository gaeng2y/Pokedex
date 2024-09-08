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
            destinations: [.iPhone, .iPad, .mac],
            product: .framework,
            bundleId: moduleBaseBundleId,
            deploymentTargets: .multiplatform(iOS: "17.0", macOS: "14.0"),
            infoPlist: .extendingDefault(
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
            ),
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
