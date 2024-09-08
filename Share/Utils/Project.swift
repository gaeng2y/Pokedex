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
            dependencies: []
        )
    ],
    schemes: []
)
