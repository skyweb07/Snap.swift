import UIKit
import XCTest

// MARK: - XCTestCase + View Expectation

extension XCTestCase {
  public func expect(_ view: UIView, function: String = #function, file: String = #file ) -> ViewMatcher {
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
  
  public func expect(_ viewController: UIViewController, function: String = #function, file: String = #file ) -> ViewMatcher {
    return self.expect(viewController.view, function: function, file: file)
  }
}
