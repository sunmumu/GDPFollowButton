#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/

Pod::Spec.new do |s|
  s.name         = 'GDPFollowButton'
  s.version      = '1.0.2'
  s.summary      = 'Follow/follow each other/followed/not followed, multi-state buttons'
  s.homepage     = 'https://github.com/sunmumu/GDPFollowButton'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'sunmumu' => '335089101@qq.com' }
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source       = { :git => 'https://github.com/sunmumu/GDPFollowButton.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'GDPFollowButton/**/*.{h,m}'
  s.public_header_files = 'GDPFollowButton/**/*.{h}'
  
  s.libraries = 'z'
  s.frameworks = 'UIKit'
  # s.ios.vendored_frameworks = 'Vendor/WebP.framework'
  

end
