// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

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
        .package(url: "https://github.com/rafaelesantos/refds-shared.git", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", branch: "main")
    ],
    targets: [
        .macro(
            name: "RefdsReduxMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]),
        .target(
            name: "RefdsRedux",
            dependencies: [
                "RefdsReduxMacros",
                .product(name: "RefdsShared", package: "refds-shared")
            ])
    ]
)
