import XCTest

class UIImageCompareSpec: XCTestCase {

  func test_should_throw_if_image_sizes_are_not_the_equals() throws {
    let image1 = Image.fixture(.camera, from: self)
    let image2 = Image.fixture(.tick, from: self)

    XCTAssertThrowsError(try image1.compare(with: image2), "") { error in
      let expectedError = CompareError.notEqualSize(referenceSize: CGSize(width: 33, height: 24), comparedSize: CGSize(width: 36, height: 36))
      XCTAssertEqual(error as! CompareError, expectedError)
    }
  }
  
  func test_should_throw_if_reference_image_is_invalid() throws {
    let view = UIView()
    let image1 = view.render()
    
    let image2 = Image.fixture(from: self)

    XCTAssertThrowsError(try image1?.compare(with: image2), "") { error in
      XCTAssertEqual(error as? CompareError, .invalidReferenceImage)
    }
  }
  
  func test_should_throw_if_images_are_different_by_1_px() throws {
    let image2 = Image.fixture(.tick, from: self)
    let image1 = Image.fixture(.tickModified, from: self)
    
    XCTAssertThrowsError(try image1.compare(with: image2), "") { error in
      XCTAssertEqual(error as? CompareError, .notEquals)
    }
  }
  
  func test_should_not_throw_if_images_are_equals() throws {
    let image1 = Image.fixture(from: self)
    let image2 = Image.fixture(from: self)
    
    XCTAssertNoThrow(try image1.compare(with: image2))
  }
}

// MARK: - CompareError + Equatable

extension CompareError: Equatable {
  static func ==(lhs: CompareError, rhs: CompareError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidImageSize, .invalidImageSize),
        (.notEquals, .notEquals),
        (.notEqualMetadata, .notEqualMetadata),
        (.invalidReferenceImage, .invalidReferenceImage):
      return true
    case (.notEqualSize(let referenceSizeLeft, let comparedSizeLeft),
          .notEqualSize(let referenceSizeRight, let comparedSizeRight)):
      return referenceSizeLeft == referenceSizeRight &&
             comparedSizeLeft == comparedSizeRight
    default: return false
    }
  }
}
