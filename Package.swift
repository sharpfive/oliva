// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Oliva",
    products: [
        .library(name: "Oliva", targets: ["OlivaDomain"]),
        .library(name: "SimulationLeagueSiteGenerator", targets: ["SimulationLeagueSiteGenerator"]),
        .executable(name: "LeagueResultsSite", targets: ["LeagueResultsSite"])
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Plot.git", .upToNextMajor(from: "0.7.0")),
        .package(url: "https://github.com/johnsundell/Publish.git", .upToNextMajor(from: "0.1.0")),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.1")),

    ],
    targets: [
        .target(
            name: "LeagueResultsSite",
            dependencies: [
                "OlivaDomain",
                "SimulationLeagueSiteGenerator",
                .product(name: "Plot", package: "Plot"),
                .product(name: "Publish", package: "Publish"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "OlivaDomain",
            dependencies: []
        ),
        .target(
            name: "SimulationLeagueSiteGenerator",
            dependencies: [
                "OlivaDomain",
                .product(name: "Plot", package: "Plot"),
                .product(name: "Publish", package: "Publish"),
            ]
        )
    ]
)
