// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CartoniaApp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CartoniaApp",
            targets: ["CartoniaApp"]
        ),
    ],
    targets: [
        .target(
            name: "CartoniaApp",
            path: "Sources/CartoniaApp"
        ),
        .testTarget(
            name: "CartoniaAppTests",
            dependencies: ["CartoniaApp"],
            path: "Tests/CartoniaAppTests"
        ),
    ]
)

