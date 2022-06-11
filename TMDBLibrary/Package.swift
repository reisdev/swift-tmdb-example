// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDB",
    platforms: [.macOS(.v10_12), .iOS(.v14)],
    products: [
        .library(
            name: "TMDBDomain",
            targets: ["TMDBDomain"]),
        .library(
            name: "TMDBServices",
            targets: ["TMDBServices"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.5.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TMDBDomain",
            dependencies: ["Moya", "RxSwift"]),
        .target(
            name: "TMDBServices",
            dependencies: ["TMDBDomain", "Moya", "RxSwift"]),
        .testTarget(
            name: "TMDBServicesTests",
            dependencies: ["TMDBServices", "TMDBDomain", "RxSwift"])
    ]
)
