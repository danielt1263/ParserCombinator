// swift-tools-version:5.1
//
//  Package.swift
//  ParserCombinator
//
//  Created by Liam on 16/03/2017.
//  Copyright © 2017 Tigerpixel Ltd. All rights reserved.
//

import PackageDescription

/// A ParserCombinator Package Description for use with the Swift Package Manager
let package = Package(
    name: "ParserCombinator",
    platforms: [
        // Other platforms compile as far back as possible by default.
        .macOS(.v10_10)
    ],
    products: [
        .library(name: "ParserCombinator", targets: ["ParserCombinator"])
    ],
    targets: [
        .target(name: "ParserCombinator"),
        .testTarget(name: "ParserCombinatorTests", dependencies: ["ParserCombinator"])
    ]
)
