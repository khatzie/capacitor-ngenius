// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorNgeniusPayments",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorNgeniusPayments",
            targets: ["NgeniusPaymentsPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "NgeniusPaymentsPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/NgeniusPaymentsPlugin"),
        .testTarget(
            name: "NgeniusPaymentsPluginTests",
            dependencies: ["NgeniusPaymentsPlugin"],
            path: "ios/Tests/NgeniusPaymentsPluginTests")
    ]
)