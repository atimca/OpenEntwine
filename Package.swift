// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Entwine",
    platforms: [
        .macOS(.v10_15), .iOS(.v12), .tvOS(.v12), .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Entwine",
            targets: ["Entwine"]),
        .library(
            name: "EntwineTest",
            targets: ["EntwineTest"]),
    ],
    dependencies: [
        .package(name: "OpenCombine", url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.10.0")
    ],
    targets: [
        .target(
            name: "Entwine",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenCombineDispatch", package: "OpenCombine")
            ]),
        .target(
            name: "EntwineTest",
            dependencies: [
                "Entwine",
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenCombineDispatch", package: "OpenCombine")
            ]),
        .testTarget(
            name: "EntwineTests",
            dependencies: [
                "Entwine",
                "EntwineTest",
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenCombineDispatch", package: "OpenCombine")
            ]),
        .testTarget(
            name: "EntwineTestTests",
            dependencies: [
                "EntwineTest",
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenCombineDispatch", package: "OpenCombine")
            ]),
    ]
)

