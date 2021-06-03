// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "hubkit-service-api-rx",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "HubkitApiRx",
            targets: ["HubkitApiRx"]
        ),
    ],
    dependencies: [
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/MoveUpwards/hubkit-service-api.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "HubkitApiRx",
            dependencies: [
                .product(name: "HubkitApi", package: "hubkit-service-api"),
                "RxSwift"
            ],
            path: "Sources"
        ),
    ]
)
