// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Example",
  platforms: [
    .macOS(.v10_14)
  ],
  products: [
    .executable(name: "Example", targets: ["Example"]),
  ],
  dependencies: [
    .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50300.0")),
  ],
  targets: [
    .target(
      name: "Example",
      dependencies: ["SwiftExample", "ObjcExample"]),
    .testTarget(
      name: "ExampleTests",
      dependencies: ["Example"]),

    .target(
      name: "SwiftExample",
      dependencies: ["ObjcDependency", "SwiftSyntax"]),
    .testTarget(
      name: "SwiftExampleTests",
      dependencies: ["SwiftExample"]),

    .target(
      name: "ObjcExample",
      dependencies: ["ObjcDependency"]),

    .target(
      name: "ObjcDependency"),
  ]
)
