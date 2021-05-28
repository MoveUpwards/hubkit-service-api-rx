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
            name: "HubkitServiceApiRx",
            targets: ["HubkitServiceApiRx"]
        ),
    ],
    dependencies: [
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/MoveUpwards/hubkit-service-api.git", from: "2.0.0"),
        .package(url: "https://github.com/MoveUpwards/hubkit-model-swift.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "HubkitServiceApiRx",
            dependencies: [
                .product(name: "HubkitModel", package: "hubkit-model-swift"),
                .product(name: "HubkitServiceApi", package: "hubkit-service-api"),
                "RxSwift"
            ],
            path: "Sources"
        ),
    ]
)
