import ProjectDescription

let infoPlist: [String: Plist.Value] = [
    "UILaunchStoryboardName":"LaunchScreen",
    "CFBundleVersion": "1"
]

let project = Project(
    name: "Pokedex",
    
    options: .options(
        defaultKnownRegions: ["ko"],
        developmentRegion: "ko"
    ),
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
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "com.gaeng2y.Pokedex",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["../Resources/**"],
            dependencies: [
                .project(target: "PokemonList", path: .relativeToRoot("Features/PokemonList")),
                .project(target: "Utils",  path: .relativeToRoot("Share/Utils")),
                .project(target: "Networking",  path: .relativeToRoot("Core/Networking")),
                .project(target: "Repository",  path: .relativeToRoot("Core/Repository")),
                .project(target: "DependencyInjection",  path: .relativeToRoot("DependencyInjection")),
                .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "PokedexTests",
            destinations: [.iPhone, .iPad],
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
