import XCTest
import UIKit
import SpriteKit
import SceneKit

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
    layer.startPoint = CGPoint(x: 0.0, y: 0.0)
    layer.endPoint = CGPoint(x: 1.0, y: 0.0)

    expect(layer).toMatchSnapshot()
  }
  
  func test_box_with_custom_name() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .yellow
    
    expect(view).toMatchSnapshot(named: "yellow_box")
  }
 
  func test_box_with_all_device_configurations() {
    let view = UIView()
    view.backgroundColor = .green
    
    expect(view).toMatchSnapshot(for: .allDevices)
  }
  
  func test_box_with_iphone_device_configurations() {
    let view = UIView()
    view.backgroundColor = .gray
    
    expect(view).toMatchSnapshot(for: .iPhoneDevices)
  }
  
  func test_box_with_ipad_device_configurations() {
    let view = UIView()
    view.backgroundColor = .purple
    
    expect(view).toMatchSnapshot(for: .iPadDevices)
  }

  func test_spritekit_view() {
    let scene = SKScene(size: CGSize(width: 100, height: 100))
    scene.backgroundColor = .yellow

    let rect = SKShapeNode(rectOf: CGSize(width: 10, height: 10))
    rect.fillColor = .red
    rect.strokeColor = .clear
    rect.position = CGPoint(x: 50, y: 50)
    scene.addChild(rect)

    let view = SKView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.presentScene(scene)

    expect(view).toMatchSnapshot()
  }

  func test_scenekit_view() {
    let scene = SCNScene()

    // light
    let lightNode = SCNNode()
    lightNode.light = SCNLight()
    lightNode.light!.type = .omni
    lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
    scene.rootNode.addChildNode(lightNode)

    // cube
    let cubeGeometry = SCNBox(width: 5, height: 5, length: 5, chamferRadius: 0)
    cubeGeometry.firstMaterial!.diffuse.contents = UIColor.red
    let cubeNode = SCNNode(geometry: cubeGeometry)
    scene.rootNode.addChildNode(cubeNode)

    // camera
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    scene.rootNode.addChildNode(cameraNode)
    cameraNode.position = SCNVector3(x: 10, y: 10, z: 10)
    cameraNode.constraints = [SCNLookAtConstraint(target: cubeNode)]

    let view = SCNView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .yellow
    view.scene = scene

    expect(view).toMatchSnapshot()
  }

}
