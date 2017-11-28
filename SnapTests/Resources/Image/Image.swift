import UIKit

struct Image {
  static func fixture(_ from: Any) -> UIImage {
    let bundle = Bundle(for:object_getClass(from)!)
    return UIImage(named: "tick", in: bundle, compatibleWith: nil)!
  }
}
