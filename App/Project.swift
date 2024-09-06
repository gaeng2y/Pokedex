import ProjectDescription

let project = Project(
    name: "Pokedex",
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
            name: "Pokedex",
            destinations: .iOS,
            product: .app,
            bundleId: "com.gaeng2y.Pokedex",
            deploymentTargets: .iOS("17.0"),
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
            resources: ["../Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "PokedexTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.gaeng2y.PokedexTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "Pokedex")]
        ),
    ],
    schemes: [
        .scheme(
            name: "Pokdex-Debug",
            shared: true,
            buildAction: .buildAction(targets: ["Pokedex"]),
            testAction: .targets(
                ["PokedexTests"],
                configuration: .configuration("Debug"),
                options: .options(coverage: true)
            ),
            runAction: .runAction(configuration: .configuration("Debug")),
            archiveAction: .archiveAction(configuration: .configuration("Debug")),
            profileAction: .profileAction(configuration: .configuration("Debug")),
            analyzeAction: .analyzeAction(configuration: .configuration("Debug"))
        ),
        .scheme(
            name: "Pokdex-Release",
            shared: true,
            buildAction: .buildAction(targets: ["Pokedex"]),
            testAction: .targets(
                ["PokedexTests"],
                configuration: .configuration("Release"),
                options: .options(coverage: true)
            ),
            runAction: .runAction(configuration: .configuration("Release")),
            archiveAction: .archiveAction(configuration: .configuration("Release")),
            profileAction: .profileAction(configuration: .configuration("Release")),
            analyzeAction: .analyzeAction(configuration: .configuration("Release"))
        )
    ]
)
