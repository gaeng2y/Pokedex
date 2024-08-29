import ProjectDescription

let project = Project(
    name: "Pokedex",
    targets: [
        .target(
            name: "Pokedex",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Pokedex",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Pokedex/Sources/**"],
            resources: ["Pokedex/Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "PokedexTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.PokedexTests",
            infoPlist: .default,
            sources: ["Pokedex/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Pokedex")]
        ),
    ]
)
