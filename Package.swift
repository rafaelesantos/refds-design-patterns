// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RefdsDesignPatterns",
    defaultLocalization: "pt",
    platforms: [
        .iOS(.v18),
        .macCatalyst(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
        .driverKit(.v24)
    ],
    products: [
        .library(
            name: "RefdsDesignPatterns",
            targets: ["RefdsRedux"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-shared.git", branch: "main")
    ],
    targets: [
        .target(
            name: "RefdsRedux",
            dependencies: [
                .product(
                    name: "RefdsShared",
                    package: "refds-shared"
                )
            ]),
    ]
)
