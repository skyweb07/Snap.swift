import Foundation

public struct Snap {
  public static let config = Config()
}

public final class Config {
  /// Enable Kaleidoscope ksdiff command line utils to show the difference between failed image and reference one
  public var enableKaleidoscope = false
}
