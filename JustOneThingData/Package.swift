// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JustOneThingData",
    platforms: [.iOS(.v17), .macOS(.v14), .watchOS(.v10)],
    products: [
        .library(
            name: "JustOneThingData",
            type: .dynamic,
            targets: ["JustOneThingData"]
        )
    ],
    targets: [
        .target(
            name: "JustOneThingData",
            path: "."
        )
    ]
)
