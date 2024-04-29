// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "NavigationKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "NavigationKit",
            targets: ["NavigationKit"]
        ),
    ],
    targets: [
        .target(
            name: "NavigationKit",
            dependencies: []
        ),
    ]
)
