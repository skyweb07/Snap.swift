import Foundation

final class EnvironmentStub: Environment {
  var keys = [String: String]()
  
  func get(_ key: String) -> String? {
    return keys[key]
  }
}
