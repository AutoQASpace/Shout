// swift-tools-version:5.7
// Managed by ice

import PackageDescription

let package = Package(
    name: "Shout",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "Shout", targets: ["Shout"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Kitura/BlueSocket", from: "1.0.46"),
    ],
    targets: [
        .systemLibrary(name: "CSSH", path: "Sources/CSSH", pkgConfig: "libssh2", providers: [.brew(["libssh2","openssl"])]),
        .target(
            name: "Shout",
            dependencies: [
                "CSSH",
                .product(name: "Socket", package: "BlueSocket"),
            ],
            path: "Sources/Shout"
        ),
        .testTarget(name: "ShoutTests", dependencies: ["Shout"], path: "Tests/ShoutTests"),
    ]
)
