Pod::Spec.new do |s|
  s.name             = 'Snap.swift'
  s.version          = '0.2.0'
  s.summary          = 'Snapshot testing in a snap'

  s.description      = <<-DESC
  Snap is a snapshot testing library to facilitate the UI testing of your views.
                       DESC

  s.homepage         = 'https://github.com/skyweb07/Snap.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skyweb07' => 'hi@oduran.me' }
  s.source           = { :git => 'https://github.com/skyweb07/Snap.swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/skyweb07'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Snap/Core/**/*', 'Snap/Core/Infrastructure/Interoperability/*.h'
  s.frameworks = 'UIKit', 'CoreGraphics', 'XCTest'
end
