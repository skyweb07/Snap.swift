import UIKit

protocol SnapshotViewMatcherProvider {
  func makeMatcher(with view: UIView, isRecording: Bool, tesTarget: TestTarget) -> ViewMatcher
}

struct SnapshotViewMatcher: ViewMatcher {

  private let view: UIView
  private let isRecording: Bool
  private let testTarget: TestTarget
  private let extractViewImage: ExtractViewImage
  private let compareImages: CompareImages
  
  init(view: UIView,
       isRecording: Bool = false,
       testTarget: TestTarget,
       extractViewImage: ExtractViewImage,
       compareImages: CompareImages)
  {
    self.view = view
    self.isRecording = isRecording
    self.testTarget = testTarget
    self.extractViewImage = extractViewImage
    self.compareImages = compareImages
  }
  
  func toMatchSnapshot() {
    toMatchSnapshot(named: nil)
  }
  
  func toMatchSnapshot(for devices: [Device]) {
    devices.forEach { device in
      self.toMatchSnapshot(named: nil, with: device)
    }
  }
  
  func toMatchSnapshot(for allDevices: AllDevices) {
    var deviceList = [Device]()
    
    switch allDevices {
    case .allDevices:
      deviceList = allDevices.all
    case .iPhoneDevices:
      deviceList = allDevices.iphone
    case .iPadDevices:
      deviceList = allDevices.ipad
    }

    deviceList.forEach { device in
      self.toMatchSnapshot(named: nil, with: device)
    }
  }
  
  func toMatchSnapshot(named: String?) {
    toMatchSnapshot(named: named, with: nil)
  }
  
  private func toMatchSnapshot(named: String?,
                               with device: Device? = nil)
  {
    let updatedTestTarget = testTarget.named(named, with: device)
    let updatedView = self.view
    if let device = updatedTestTarget.device {
      updatedView.frame = CGRect(origin: .zero, size: device.size)
      updatedView.layoutIfNeeded()
    }
    guard isRecording else {
      compareImages.compare(with: updatedView, testTarget: updatedTestTarget)
      return
    }
    extractViewImage.execute(with: updatedView, testTarget: updatedTestTarget)
  }
}
