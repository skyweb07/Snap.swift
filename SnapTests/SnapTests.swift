import XCTest
import UIKit

private final class SnapTests: XCTestCase {
  
  override func setUp() {
    // isRecording = true
  }
  
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
  
  func test_box_with_gradient_layer() {
    let layer = CAGradientLayer()
    layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    layer.colors = [
      UIColor.red.cgColor,
      UIColor.white.cgColor
    ]
    layer.locations = [0.0, 1.0]
    layer.startPoint = CGPoint(x: 0.0, y: 1.0)
    layer.endPoint = CGPoint(x: 0.0, y: 1.0)

    expect(layer).toMatchSnapshot()
  }
  
  func test_box_with_custom_name() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .yellow
    
    expect(view).toMatchSnapshot(named: "yellow_box")
  }
}
