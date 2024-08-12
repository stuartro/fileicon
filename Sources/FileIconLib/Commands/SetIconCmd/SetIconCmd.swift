import ArgumentParser
import Foundation
import TerminalColor

public struct SetIconCmd: ParsableCommand {
   public init() {}
   
   public static let configuration = CommandConfiguration(
      commandName: "set",
      abstract: "Set a custom icon for a file or folder"
   )
   
   // MARK: OPTIONS
   @Option(name: [.customShort("f"), .customLong("fileOrFolder"), ],
           help: "File or folder to which a custom icon is to be applied")
   public var fileOrFolder: String
   
   @Option(name: [.customShort("i"), .customLong("imageFile"), ],
           help: "Image file to use as custom icon (typically .icns or .png)")
   public var imageFile: String
   
   @Flag(name: [.customLong("no-color")],
         help: "Do not use color in output written to stdout or stderr")
   public var noColor: Bool = false
   
   mutating public func run() throws {
      do {
         ColorCode.COLOR_ENABLED = !noColor
         try SetIconCmdImpl(args: self).setIcon()
      } catch {
         var standardError = StderrOutputStream()
         print("ERROR:".fg(.red) + " \(error)".fg(.yellow), to: &standardError)
      }
   }
}

