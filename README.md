# Refds Design Patterns

[![CI](https://github.com/rafaelesantos/refds-design-patterns/actions/workflows/swift.yml/badge.svg)](https://github.com/rafaelesantos/refds-design-patterns/actions/workflows/swift.yml)

This repository contains a library (Swift Package) for implementing various architecture design patterns in Swift projects. Design patterns are generalized solutions to recurring problems in software development, and their application can improve code organization, maintainability, and scalability.

## Installation

Add this project to your `Package.swift` file.

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-design-patterns.git", branch: "main")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: [
                .product(
                    name: "RefdsDesignPatterns",
                    package: "refds-design-patterns"),
            ]),
    ]
)
```
