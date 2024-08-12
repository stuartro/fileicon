import Foundation
import Cocoa
import TerminalColor

public class GetIconCmdImpl {
   private let args:  GetIconCmd
   
   public init(args:  GetIconCmd) {
      self.args = args
   }
   
   // MARK: - PUBLIC FUNCTIONS
   /// Creates a new note in DEVONthink
   public func getIcon_and_SaveToDisk() throws {
      do {
         if (!FileManager.default.fileExists(atPath: args.fileOrFolder)) {
            throw "Target file/folder `\(args.fileOrFolder)` does not exist or is not readable."
         }
         let iconImage = NSWorkspace.shared.icon(forFile: args.fileOrFolder)
         _ = try iconImage.pngWrite(to: URL(fileURLWithPath: args.iconOutputFile))
         print("Saved custom icon from " + "\(args.fileOrFolder)".fg(.cyan) + " to " + "\(args.iconOutputFile)".fg(.cyan))
      }
   }
}

extension NSImage {
   var pngData: Data? {
      guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
      return bitmapImage.representation(using: .png, properties: [:])
   }
   func pngWrite(to url: URL, options: Data.WritingOptions = .atomic) throws -> Bool {
      do {
         try pngData?.write(to: url, options: options)
         return true
      } catch {
         throw error
      }
   }
}
