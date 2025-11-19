// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorAnimatedSplash",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CapacitorAnimatedSplash",
            targets: ["AnimatedSplashPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "AnimatedSplashPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/AnimatedSplashPlugin"),
        .testTarget(
            name: "AnimatedSplashPluginTests",
            dependencies: ["AnimatedSplashPlugin"],
            path: "ios/Tests/AnimatedSplashPluginTests")
    ]
)