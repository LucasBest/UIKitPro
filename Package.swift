// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "UIKitPro",
    platforms: [
        .iOS(.v10), .watchOS(.v2), .tvOS(.v10), .macOS(.v10_12),
    ], products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "UIKitPro",
            targets: ["UIKitPro"]),
    ],
    targets: [
        .target(
            name: "UIKitPro",
            path: "UIKitPro/Classes/"),
        .testTarget(
            name: "UIKitProTests",
            dependencies: ["UIKitPro"],
            path: "Example/Tests/"),
    ]
)
