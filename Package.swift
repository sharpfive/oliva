// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Oliva",
    products: [
        .library(name: "Oliva", targets: ["OlivaDomain"]),
        .library(name: "SimulationLeagueSiteGenerator", targets: ["SimulationLeagueSiteGenerator"]),
        .executable(name: "LeagueResultsSite", targets: ["LeagueResultsSite"])
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Plot.git", from: "0.7.0"),
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", .exact("0.5.0")),

    ],
    targets: [
        .target(
            name: "LeagueResultsSite",
            dependencies: ["Plot", "Publish", "OlivaDomain", "SimulationLeagueSiteGenerator", "SPMUtility"]
        ),
        .target(
            name: "OlivaDomain",
            dependencies: []
        ),
        .target(
            name: "SimulationLeagueSiteGenerator",
            dependencies: ["Plot", "Publish", "OlivaDomain"]
        )
    ]
)
