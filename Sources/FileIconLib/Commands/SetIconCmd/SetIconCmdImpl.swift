import Foundation
import Cocoa

public class SetIconCmdImpl {
   private let args: SetIconCmd
   
   public init(args: SetIconCmd) {
      self.args = args
   }
   
   public func setIcon() throws {
      let image = NSImage.init(contentsOfFile: args.imageFile)
      NSWorkspace.shared.setIcon(image, forFile: args.fileOrFolder)
   }
}
