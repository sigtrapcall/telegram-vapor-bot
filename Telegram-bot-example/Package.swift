// swift-tools-version:5.5

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
]

packageDependencies.append(.package(name: "TelegramVaporBot", path: "/Users/nerzh/mydata/swift_projects/telegram-vapor-bot"))
//packageDependencies.append(.package(name: "telegram-vapor-bot", url: "https://github.com/nerzh/telegram-vapor-bot", .upToNextMajor(from: "1.0.2")))


let package = Package(
    name: "Telegram-bot-example",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: "Telegram-bot-example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "TelegramVaporBot", package: "TelegramVaporBot"),
            ]
        )
    ]
)


