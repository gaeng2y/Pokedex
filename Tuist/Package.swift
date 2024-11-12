// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [
            "ComposableArchitecture": .framework
        ],
        baseSettings: .settings(
            base: [
                "EXCLUDED_ARCHS[sdk=iphonesimulator*]": "arm64"
            ],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ],
            defaultSettings: .recommended
        )
    )
#endif

let package = Package(
    name: "Pokedex",
    dependencies: [
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            .upToNextMajor(from: "1.14.0")
        ),
        .package(
            url: "https://github.com/kinkofer/PokemonAPI.git",
            .upToNextMajor(from: "6.1.0")
        )
    ]
)
