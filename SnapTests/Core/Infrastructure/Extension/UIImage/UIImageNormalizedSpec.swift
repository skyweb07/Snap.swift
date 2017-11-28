import XCTest
import UIKit

class UIImageNormalizedSpec: XCTestCase {
  
  func test_should_normalize_image_into_data() {
    let image = Image.fixture(self)
    let data = image.normalizedImage
    
    XCTAssertNotNil(data)
  }
}
