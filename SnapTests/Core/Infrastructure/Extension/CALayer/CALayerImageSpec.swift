import XCTest
import UIKit

class CALayerImageSpec: XCTestCase {

  func test_should_render_image_from_calayer() {
    let layer = CALayer()
    layer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    layer.backgroundColor = UIColor.red.cgColor
    
    let image = layer.image()
    
    XCTAssertNotNil(image)
  }
  
  func test_not_render_image_if_layer_if_its_invalid() {
    let layer = CALayer()
    
    let image = layer.image()
    
    XCTAssertNil(image)
  }
  
  func test_image_should_have_same_size_as_the_layer() {
    let layer = CALayer()
    layer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)

    let image = layer.image()
    
    XCTAssertEqual(image?.size, layer.frame.size)
  }
  
  func test_image_should_have_same_content_scale_as_the_layer() {
    let layer = CALayer()
    layer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    
    let image = layer.image()
    
    XCTAssertEqual(image?.scale, layer.contentsScale)
  }
}
