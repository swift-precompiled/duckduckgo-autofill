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
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Autofill",
            url: "https://github.com/swift-precompiled/duckduckgo-autofill/releases/download/19.2.0/Autofill-a0289ef46e70db1c5f489b63c1208b9e24295f0af4495930b41206db016938e6.xcframework.zip",
            checksum: "a0289ef46e70db1c5f489b63c1208b9e24295f0af4495930b41206db016938e6"
        ),
        .target(
            name: "AutofillResources_Aggregation",
            dependencies: ["AutofillResources"],
            resources: [
                .copy("autofill.js"),
                .copy("autofill-debug.js"),
                .copy("autofill.css"),
                .copy("autofill-design-tokens.css"),
                .copy("shared-credentials.json"),
                .copy("TopAutofill.html")
            ],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "AutofillResources",
            url: "https://github.com/swift-precompiled/duckduckgo-autofill/releases/download/19.2.0/AutofillResources-a3b158b4fd7825557e33ff014541af627f52d2a58cf780ac35f72392a3505204.xcframework.zip",
            checksum: "a3b158b4fd7825557e33ff014541af627f52d2a58cf780ac35f72392a3505204"
        ),
        .target(
            name: "Autofill_PrecompiledProduct",
            dependencies: ["Autofill_Aggregation", "AutofillResources_Aggregation"],
            packageAccess: false
        )
    ]
)