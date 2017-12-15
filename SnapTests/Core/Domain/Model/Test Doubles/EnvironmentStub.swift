import Foundation

final class FakeEnvironmentStub: Environment {
  var keys = [String: String]()
  
  func get(_ key: String) -> String? {
    return keys[key]
  }
}
