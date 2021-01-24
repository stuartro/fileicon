import Foundation
import Cocoa

public class RemoveIconCmdImpl {
   private let args: RemoveIconCmd
   
   public init(args: RemoveIconCmd) {
      self.args = args
   }
   
   // MARK: - PUBLIC FUNCTIONS
   /// Creates a new note in DEVONthink
   public func removeCustomIcon() throws {
      NSWorkspace.shared.setIcon(nil, forFile: args.fileOrFolder)
   }
}
