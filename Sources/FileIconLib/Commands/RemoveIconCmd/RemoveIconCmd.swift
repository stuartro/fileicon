import ArgumentParser
import Foundation
import TerminalColor

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
   
   @Flag(name: [.customLong("no-color")],
         help: "Do not use color in output written to stdout or stderr")
   public var noColor: Bool = false
   
   mutating public func run() throws {
      do {
         ColorCode.COLOR_ENABLED = !noColor
         try RemoveIconCmdImpl(args: self).removeCustomIcon()
      } catch {
         var standardError = StderrOutputStream()
         print("ERROR:".fg(.red) + " \(error)".fg(.yellow), to: &standardError)
      }
   }
}

