import XCTest
import UIKit

class SnapTests: XCTestCase {
  
  func test_box_with_background_color() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .red
    
    expect(view).toMatchSnapshot()
  }
  
  func test_box_with_text_aligned_to_center() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .red
    
    let label = UILabel(frame: view.bounds)
    label.text = "Snap!"
    label.textAlignment = .center
    view.addSubview(label)
   
    expect(view).toMatchSnapshot()
  }
}
