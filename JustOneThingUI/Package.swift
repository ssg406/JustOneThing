// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JustOneThingUI",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "JustOneThingUI",
            type: .dynamic,
            targets: ["JustOneThingUI"]
        )
    ],
    targets: [
        .target(
            name: "JustOneThingUI",
            dependencies: [],
            path: ".",
            resources: [.process("Fonts")]
        )
    ]
)
