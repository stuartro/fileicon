import Foundation
import Cocoa

public class GetIconCmdImpl {
   private let args:  GetIconCmd
   
   public init(args:  GetIconCmd) {
      self.args = args
   }
   
   // MARK: - PUBLIC FUNCTIONS
   /// Creates a new note in DEVONthink
   public func getIcon_and_SaveToDisk() throws {
      do {
         let iconImage = NSWorkspace.shared.icon(forFile: args.fileOrFolder)
         _ = iconImage.pngWrite(to: URL(fileURLWithPath: args.iconOutputFile))
      }
   }
}

extension NSImage {
   var pngData: Data? {
      guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
      return bitmapImage.representation(using: .png, properties: [:])
   }
   func pngWrite(to url: URL, options: Data.WritingOptions = .atomic) -> Bool {
      do {
         try pngData?.write(to: url, options: options)
         return true
      } catch {
         print(error)
         return false
      }
   }
}
