import XCTest

final class TestTargetSpec: XCTestCase {
  
  private var environment: EnvironmentStub!
  
  override func setUp() {
    super.setUp()
    environment = EnvironmentStub()
  }
  
  override func tearDown() {
    environment = nil
    super.tearDown()
  }
  
  func test_should_throw_assertion_if_environment_path_is_not_set() {
    givenEnviromentIsNotSet()

    let reference = givenTestTarget()
 
    assertThrowException() {
      let _ = reference.reference(for: .reference).path
    }
  }
  
  func test_should_no_throw_if_environment_path_is_set() {
    givenEnvironment()
    
    let reference = givenTestTarget()
    
    assertNoThrowException() {
      let _ = reference.reference(for: .reference).path
    }
  }
  
  func test_should_throw_assertion_if_given_path_is_invalid() {
    givenEnvironment(with: "invalid/path/")
    
    let reference = givenTestTarget()
    
    assertThrowException() {
      let _ = reference.reference(for: .reference).path
    }
  }
  
  func test_should_return_correct_path_for_test_target() {
   givenEnvironment()
    
    let reference = givenTestTarget()
    
    let referencePath = reference.reference(for: .reference).path
    let expectedPath = "\(currentPath)/Snap/file/reference_function@2x.png"
    
    XCTAssertEqual(referencePath.path, expectedPath)
  }
  
  func test_should_return_correct_path_for_test_target_with_reference_path_with_spaces() {
    givenEnvironment()
    
    let reference = givenTestTarget(
      with: "function name"
    )

    let referencePath = reference.reference(for: .reference).path
    let expectedPath = "\(currentPath)/Snap/file/reference_function_name@2x.png"
    
    XCTAssertEqual(referencePath.path, expectedPath)
  }
  
  func test_should_return_correct_path_for_test_target_with_custom_name() {
    givenEnvironment()
    
    let reference = givenTestTarget(
      with: "function name",
      named: "custom name"
    )
  
    let referencePath = reference.reference(for: .reference).path
    let expectedPath = "\(currentPath)/Snap/file/reference_custom_name@2x.png"
    
    XCTAssertEqual(referencePath.path, expectedPath)
  }
  
  func test_should_return_correct_path_for_test_target_with_custom_devices() {
    givenEnvironment()
    
    AllDevices.allDevices.all.forEach { device in
      let reference = givenTestTarget(
        with: "function name",
        named: "custom name",
        device: device
      )
      
      let referencePath = reference.reference(for: .reference).path
      let expectedPath = "\(currentPath)/Snap/file/reference_\(device.rawValue.lowercased())_custom_name@2x.png"
      
      XCTAssertEqual(referencePath.path, expectedPath)
    }
  }
  
  func test_should_return_correct_path_for_different_test_targets() {
    givenEnvironment()
    
    let reference = givenTestTarget(
      with: "function name",
      named: "custom name"
    )
    
    let referencePath = reference.reference(for: .reference).path
    let failedPath = reference.reference(for: .failed).path
    let diffPath = reference.reference(for: .diff).path

    let expectedReferencePath = "\(currentPath)/Snap/file/reference_custom_name@2x.png"
    let expectedFailedPath = "\(currentPath)/Snap/Failed/file/failed_custom_name@2x.png"
    let expectedDiffPath = "\(currentPath)/Snap/Diff/file/diff_custom_name@2x.png"
    
    XCTAssertEqual(referencePath.path, expectedReferencePath)
    XCTAssertEqual(failedPath.path, expectedFailedPath)
    XCTAssertEqual(diffPath.path, expectedDiffPath)
  }
}

// MARK: - Helpers

extension TestTargetSpec {
  private func givenEnviromentIsNotSet() {
    environment.keys[Path.referenceImage] = nil
  }
  
  private func givenEnvironment(with path: String? = FileManager.default.currentDirectoryPath) {
    environment.keys[Path.referenceImage] = path
  }
  
  private func givenTestTarget(with function: String = "function",
                               file: String = "file",
                               named: String? = nil,
                               device: Device? = nil) -> TestTarget
  {
    return TestTarget(
      function: function,
      file: file,
      named: named,
      device: device,
      fileManager: .default,
      environment: environment
    )
  }
  var currentPath: String {
    return FileManager.default.currentDirectoryPath
  }
}
