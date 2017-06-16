import PackageDescription

let package = Package(
    name: "Engine",
    targets: [
        Target(name: "CHTTP"),
        Target(name: "URI", dependencies: ["CHTTP"]),
        Target(name: "Cookies", dependencies: ["HTTPVapor"]),
        Target(name: "HTTPVapor", dependencies: ["URI", "CHTTP"]),
        Target(name: "WebSockets", dependencies: ["HTTPVapor", "URI"]),
        Target(name: "SMTP")
        // Target(name: "Performance", dependencies: ["HTTPVapor"])
    ],
    dependencies: [
    // Crypto
    .Package(url: "https://github.com/vapor/crypto.git", majorVersion: 2),

    // Secure Sockets
    .Package(url: "https://github.com/vapor/tls.git", majorVersion: 2),
    ],
    exclude: [
        "Sources/Performance"
    ]
)
