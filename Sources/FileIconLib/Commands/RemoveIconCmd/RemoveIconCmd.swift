import ArgumentParser
import Foundation

/// A command that removes custom icons from file/folder.
public struct RemoveIconCmd: ParsableCommand {
   public init() {}
   
   public static let configuration = CommandConfiguration(
      commandName: "rm",
      abstract: "Remove a custom icon from a file or folder"
   )
   
   
   @Option(name: [.customShort("f"), .customLong("fileOrFolder")],
           help: "File or folder to remove custom icon from")
   var fileOrFolder: String
   
   mutating public func run() throws {
      do {
         try RemoveIconCmdImpl(args: self).removeCustomIcon()
      } catch {
         print("ERROR: \(error)")
      }
   }
}

