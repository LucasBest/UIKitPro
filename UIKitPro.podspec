Pod::Spec.new do |s|
  s.name             = 'UIKitPro'
  s.version          = '0.7.0'
  s.summary          = 'UIKitPro is a small set of UIKit additions and extensions to supplement the development of UIKit apps.'

  s.description      = <<-DESC
    With UIKitPro you can utilize UIKit to an even greater extent than you could before. UIKit extends functionality into Interface Builder and common UIView subclasses.
                       DESC

  s.homepage         = 'https://github.com/LucasBest/UIKitPro'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lucas Best' => 'lucas.best.5@gmail.com' }
  s.source           = { :git => 'https://github.com/LucasBest/UIKitPro.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thereallu5'

  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'UIKitPro/Classes/**/*'

  s.frameworks = 'UIKit'
end
