import ArgumentParser
import Foundation

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
   
   
   mutating public func run() throws {
      do {
         try SetIconCmdImpl(args: self).setIcon()
      } catch {
         print("ERROR: \(error)")
      }
   }
}

