// MARK: - Matcher

public protocol Matcher: Nameable {
  func toMatchSnapshot()
}

public protocol ViewMatcher: Matcher, DeviceMatcher {}
public protocol LayerMatcher: Matcher {}

// MARK: - Matcher extensions

public protocol Nameable {
  func toMatchSnapshot(named: String?)
}

public protocol DeviceMatcher {
  func toMatchSnapshot(`for` devices: [Device])
  func toMatchSnapshot(`for` allDevices: AllDevices)
  func toMatchSnapshot(named name: String?, `for` devices: [Device])
  func toMatchSnapshot(named name: String?, `for` allDevices: AllDevices)
}
