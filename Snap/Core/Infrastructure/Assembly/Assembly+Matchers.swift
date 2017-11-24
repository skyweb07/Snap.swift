import UIKit

// MARK: - SnapshotViewMatcherProvider

extension Assembly: SnapshotViewMatcherProvider {
  func makeMatcher(with view: UIView, isRecording: Bool, tesTarget: TestTarget) -> Matcher {
    return SnapshotViewMatcher(
      view: view,
      isRecording: isRecording,
      testTarget: tesTarget,
      extractViewImage: extractViewImage,
      compareImages: compareImages
    )
  }
}
