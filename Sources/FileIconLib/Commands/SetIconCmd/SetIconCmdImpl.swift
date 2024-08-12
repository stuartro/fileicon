import Foundation
import Cocoa
import TerminalColor

public enum FileIconError: Error {
   case noImage(_ errorMessage: String)
   case noFileOrFolder(_ errorMessage: String)
}

extension String: Error {}

public class SetIconCmdImpl {
   private let args: SetIconCmd
   
   public init(args: SetIconCmd) {
      self.args = args
   }
   
   public func setIcon() throws {
      if (!FileManager.default.fileExists(atPath: args.imageFile)) {
         throw "Image file `\(args.imageFile)` does not exist or is not readable."
      }
      if (!FileManager.default.fileExists(atPath: args.fileOrFolder)) {
         throw "Target file/folder `\(args.fileOrFolder)` does not exist or is not readable."
      }
      guard let image = NSImage.init(contentsOfFile: args.imageFile) else { throw "`\(args.imageFile)` is not an image file." }
      NSWorkspace.shared.setIcon(image, forFile: args.fileOrFolder)
      print("Set custom icon on " + "\(args.fileOrFolder)".fg(.cyan))
   }
}
