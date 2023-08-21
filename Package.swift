// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Segment-Appboy",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(name: "AppboySegment", targets: ["AppboySegment"]),
    .library(name: "AppboySegmentCore", targets: ["AppboySegmentCore"])
  ],
  dependencies: [
    .package(name: "Segment", url: "https://github.com/segmentio/analytics-ios.git", from: "4.1.1"),
    .package(url: "https://github.com/airtasker/braze-ios-sdk", .branchItem("NT-fix-package.swift"))
  ],
  targets: [
    .target(
      name: "AppboySegment",
      dependencies: [
          .product(name: "Segment", package: "Segment"),
          .product(name: "AppboyUI", package: "braze-ios-sdk"),
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath(".")
      ]
    ),
    .target(
      name: "AppboySegmentCore",
      dependencies: [
          .product(name: "Segment", package: "Segment"),
          .product(name: "AppboyKit", package: "braze-ios-sdk"),
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath(".")
      ]
    )
  ]
)
