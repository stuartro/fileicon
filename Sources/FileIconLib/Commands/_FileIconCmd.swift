import ArgumentParser
import Foundation

public struct FileIconCmd: ParsableCommand {
   public init() {}
   
   public static let configuration = CommandConfiguration(
      commandName: "fileicon",
      abstract: "Manipulate custom icons for files/folders in macOS",
      subcommands: [
         GetIconCmd.self,
         RemoveIconCmd.self,
         SetIconCmd.self,
      ])
}
