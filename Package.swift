// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Oliva",
    dependencies: [
    .package(url: "https://github.com/JohnSundell/Plot.git", from: "0.7.0"),
    .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "LeagueResultsSite",
            dependencies: ["Plot", "Publish"]
        ),
        .target(
            name: "ViewModels",
            dependencies: []
        )
    ]
)
