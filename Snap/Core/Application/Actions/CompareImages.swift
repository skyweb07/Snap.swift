import UIKit
import XCTest

struct CompareImages {
  
  private let fileManager: FileManager
  private let addAttachment: AddAttachment
  
  init(fileManager: FileManager,
       addAttachment: AddAttachment)
  {
    self.fileManager = fileManager
    self.addAttachment = addAttachment
  }
  
  func compare(with view: UIView, testTarget: TestTarget) {
    guard let image = view.render() else {
      fatalError("🖼 Can not extract image from view")
    }
    
    let reference = testTarget.reference(for: .reference).path
    guard fileManager.fileExists(atPath: reference.absoluteString) else {
      XCTFail("🚫 Reference image not found [`\(reference)`]")
      return
    }
    
    guard let referenceImage = UIImage(contentsOfFile: reference.standardizedFileURL.absoluteString) else {
      XCTFail("🚫 Error loading reference image [`\(reference)`]")
      return
    }
    
    guard let pngImage = UIImagePNGRepresentation(image), let processedImage = UIImage(data: pngImage) else {
      XCTFail("🚫 Cannot process view image")
      return
    }
    
    addAttachment.execute(with: referenceImage, type: .reference)
    
    do {
      try referenceImage.compare(with: processedImage)
    } catch CompareError.notEqualSize(let referenceSize, let comparedSize) {
      self.process(failedImage: processedImage, reference: referenceImage)
       XCTFail("📏 Image sizes should be equals, reference image size: \(referenceSize), compared image size: \(comparedSize)")
    } catch CompareError.invalidImageSize {
      self.process(failedImage: processedImage, reference: referenceImage)
       XCTFail("📏 One of the images has 0 size")
    } catch CompareError.notEquals {
      self.process(failedImage: processedImage, reference: referenceImage)
       XCTFail("≠ Images are not equal")
    } catch CompareError.notEqualMetadata {
      self.process(failedImage: processedImage, reference: referenceImage)
      XCTFail("👾 Images have different metadata information")
    } catch {
      self.process(failedImage: processedImage, reference: referenceImage)
      XCTFail("🚫 Unknown error")
    }
  }
  
  private func process(failedImage: UIImage, reference: UIImage) {
    addAttachment.execute(with: failedImage, type: .failed)
    guard let diffedImage = reference.diff(with: failedImage) else { return }
    addAttachment.execute(with: diffedImage, type: .diff)
  }
}
