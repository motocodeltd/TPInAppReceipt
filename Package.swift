// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TPInAppReceipt",
	platforms: [.macOS(.v10_11),
				.iOS(.v10),
				.tvOS(.v10),
				.watchOS("6.2")],
	
    products: [
        .library(name: "TPInAppReceipt", targets: ["TPInAppReceipt"]),
    ],
	dependencies: [.package(name: "ASN1Swift", url: "https://github.com/tikhop/ASN1Swift", .branch("eb862bb7cd3a1a4e93d1914185d1053cfee66c5d"))],
    targets: [
        .target(
            name: "TPInAppReceipt",
			dependencies: ["ASN1Swift"],
			path: "Sources",
			exclude: ["Bundle+Extension.swift"],
			resources: [.process("AppleIncRootCertificate.cer"), .process("StoreKitTestCertificate.cer")]
		),
		.testTarget(
			name: "TPInAppReceiptTests",
			dependencies: ["TPInAppReceipt"])
	]
)

    
