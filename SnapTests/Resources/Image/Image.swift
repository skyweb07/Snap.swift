import UIKit

enum FixtureType: String {
  case tick = "tick"
  case tickModified = "tick_modified" // One pixel added
  case camera = "camera"
}

struct Image {
  static func fixture(_ type: FixtureType = .tick, from: Any) -> UIImage {
    let bundle = Bundle(for:object_getClass(from)!)
    return UIImage(named: type.rawValue, in: bundle, compatibleWith: nil)!
  }
}
