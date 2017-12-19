extension AllDevices {
  var all: [Device] {
    return [
      .iPhone5, .iPhone8, .iPhone8Plus, .iPhoneX,
      .iPadMini, .iPadAir, .iPadPro105, .iPadPro129
    ]
  }
  var iphone: [Device] {
    return [
      .iPhone5, .iPhone8, .iPhone8Plus, .iPhoneX
    ]
  }
  var ipad: [Device] {
    return [
      .iPadMini, .iPadAir, .iPadPro105, .iPadPro129
    ]
  }
}
