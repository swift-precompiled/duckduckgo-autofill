// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "duckduckgo-autofill",
    products: [
        .library(
            name: "Autofill",
            targets: [
                "Autofill",
                "AutofillResources",
                "Autofill_PrecompiledProduct"
            ]
        )
    ],
    targets: [
        .target(
            name: "Autofill_Aggregation",
            dependencies: ["Autofill"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Autofill",
            url: "https://github.com/swift-precompiled/duckduckgo-autofill/releases/download/19.2.0/Autofill-83ddb66f0d21da67ea814511f9b59609bc40e7710d6acf3efeeb94466d172c87.xcframework.zip",
            checksum: "83ddb66f0d21da67ea814511f9b59609bc40e7710d6acf3efeeb94466d172c87"
        ),
        .target(
            name: "AutofillResources_Aggregation",
            dependencies: ["AutofillResources"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "AutofillResources",
            url: "https://github.com/swift-precompiled/duckduckgo-autofill/releases/download/19.2.0/AutofillResources-79cbb392db87bad67ba812992fd1a88bd82f39b0eaa0bb943f3eaf16a7c6d73f.xcframework.zip",
            checksum: "79cbb392db87bad67ba812992fd1a88bd82f39b0eaa0bb943f3eaf16a7c6d73f"
        ),
        .target(
            name: "Autofill_PrecompiledProduct",
            dependencies: ["Autofill_Aggregation", "AutofillResources_Aggregation"]
        )
    ]
)