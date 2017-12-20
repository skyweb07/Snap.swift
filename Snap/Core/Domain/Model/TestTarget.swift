import UIKit

struct TestTarget {
  
  let function: String
  let file: String
  let named: String?
  let device: Device?
  let fileManager: FileManager
  let environment: Environment
  
  init(function: String,
       file: String,
       named: String? = nil,
       device: Device? = nil,
       fileManager: FileManager = resolver.fileManager,
       environment: Environment = resolver.environment)
  {
    self.function = function
    self.file = file
    self.named = named
    self.device = device
    self.fileManager = fileManager
    self.environment = environment
  }
}

extension TestTarget {
  func named(_ named: String?, with device: Device? = nil) -> TestTarget {
    return TestTarget(function: function, file: file, named: named, device: device)
  }
}
