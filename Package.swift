// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "FileIcon",
   
   platforms: [
      .macOS(.v10_11)
   ],
   
   products: [
      .library(
         name: "FileIconLib",
         type: .static, 
         targets: ["FileIconLib"]),
      
      
      .executable(
         name: "fileicon",
         targets: ["fileicon"]),
   ],
   
   dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "0.1.0"),
   ],
   
   targets: [
      .target(
         name: "FileIconLib",
         dependencies: []),
      
      .target(name: "fileicon",
              dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser"),
                             "FileIconLib"]),
   ]
)
