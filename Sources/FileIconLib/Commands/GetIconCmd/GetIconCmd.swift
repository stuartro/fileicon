import ArgumentParser
import Foundation
import TerminalColor

/// A command that retrieves a custom icon from a file/folder and saves it to disk as an image file.
public struct GetIconCmd: ParsableCommand {
   public init() {}
   
   public static let configuration = CommandConfiguration(
      commandName: "get",
      abstract: "Get (and save to disk) a file or folder’s custom icon"
   )
   
   @Option(name: [.customShort("f"), .customLong("fileOrFolder")],
           help: "File or folder that has a custom icon")
   var fileOrFolder: String
   
   
   @Option(name: [.customShort("o"), .customLong("iconOutputFile"), ],
           help: "Image file to save the file/folder’s custom icon to")
   public var iconOutputFile: String
   
   
   @Flag(name: [.customLong("force")],
         help: "Force replacement of existing output file")
   var force = false
   
   @Flag(name: [.customLong("no-color")],
         help: "Do not use color in output written to stdout or stderr")
   public var noColor: Bool = false
   
   mutating public func run() throws {
      do {
         ColorCode.COLOR_ENABLED = !noColor
         try GetIconCmdImpl(args: self).getIcon_and_SaveToDisk()
      } catch {
         var standardError = StderrOutputStream()
         print("ERROR:".fg(.red) + " \(error)".fg(.yellow), to: &standardError)
      }
   }
}

