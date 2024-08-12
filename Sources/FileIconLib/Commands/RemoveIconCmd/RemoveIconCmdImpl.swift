import Foundation
import Cocoa
import TerminalColor

public class RemoveIconCmdImpl {
   private let args: RemoveIconCmd
   
   public init(args: RemoveIconCmd) {
      self.args = args
   }
   
   // MARK: - PUBLIC FUNCTIONS
   /// Creates a new note in DEVONthink
   public func removeCustomIcon() throws {
      if (!FileManager.default.fileExists(atPath: args.fileOrFolder)) {
         throw "Target file/folder `\(args.fileOrFolder)` does not exist or is not readable."
      }
      NSWorkspace.shared.setIcon(nil, forFile: args.fileOrFolder)
      print("Removed custom icon from " + "\(args.fileOrFolder)".fg(.cyan))
   }
}
