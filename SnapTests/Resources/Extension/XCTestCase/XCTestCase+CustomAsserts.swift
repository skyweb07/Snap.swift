import XCTest
import CwlCatchException
import CwlPreconditionTesting

extension XCTestCase {
  func assertThrowException(f: @escaping () -> Void) {
    let instruction = catchBadInstruction {
      f()
    }
    
    guard let _ = instruction else {
      XCTFail("No exceptions were thrown")
      return
    }
  }
  
  func assertNoThrowException(f: @escaping () -> Void) {
    XCTAssertNil(catchBadInstruction { f() })
  }
}
