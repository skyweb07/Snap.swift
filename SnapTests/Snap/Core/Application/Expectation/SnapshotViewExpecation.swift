import UIKit
import XCTest

// MARK: - XCTestCase + Expectation

extension XCTestCase: Expectation {
  public func expect(_ view: UIView, function: String = #function, file: String = #file ) -> Matcher {
    let testTarget = TestTarget(
      function: function,
      file: file
    )
    return resolver.makeMatcher(
      with: view,
      isRecording: isRecording,
      tesTarget: testTarget
    )
  }
}
