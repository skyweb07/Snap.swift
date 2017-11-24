import UIKit

struct SaveImageToDisk {
  
  private let environment: Environment
  private let fileManager: FileManager
  private let addAttachment: AddAttachment
  
  init(environment: Environment,
       fileManager: FileManager,
       addAttachment: AddAttachment)
  {
    self.environment = environment
    self.fileManager = fileManager
    self.addAttachment = addAttachment
  }
  
  func execute(with image: UIImage, testTarget: TestTarget) {
    let reference = testTarget.reference(for: .reference)
    let referenceImage = UIImagePNGRepresentation(image)
    
    do {
      try fileManager.createDirectory(atPath: reference.directory.absoluteString, withIntermediateDirectories: true)
    } catch {
      fatalError("🚨 Error creating reference image directory ['\(reference.directory)']")
    }
    guard fileManager.createFile(atPath: reference.path.absoluteString, contents: referenceImage) else {
      fatalError("🚨 Error saving reference image into ['\(reference.path)']")
    }
    addAttachment.execute(with: image, type: .reference)
  }
}
