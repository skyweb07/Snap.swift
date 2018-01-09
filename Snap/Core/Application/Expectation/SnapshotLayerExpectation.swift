import UIKit
import XCTest

// MARK: - XCTestCase + CALayer Expectation

extension XCTestCase {
  public func expect(_ layer: CALayer, function: String = #function, file: String = #file ) -> LayerMatcher {
    let testTarget = TestTarget(
      function: function,
      file: file
    )
    layer.layoutIfNeeded()
    
    return resolver.makeMatcher(
      with: layer,
      isRecording: isRecording,
      tesTarget: testTarget
    )
  }
}
