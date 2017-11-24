import UIKit
import XCTest

struct ExtractViewImage {

  private let saveImageToDisk: SaveImageToDisk
 
  init(saveImageToDisk: SaveImageToDisk) {
    self.saveImageToDisk = saveImageToDisk
  }
  
  func execute(with view: UIView, testTarget: TestTarget) {
    guard let image = view.render() else {
      fatalError("🖼 Can not extract image from view")
    }
    saveImageToDisk.execute(with: image, testTarget: testTarget)
    
    XCTFail("⚠️ Test ran in record mode, reference image has been saved to \(testTarget.reference(for: .reference).path), now remove `isRecording` in order to perform the snapshot comparsion.")
  }
}
