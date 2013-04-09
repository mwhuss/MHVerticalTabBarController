#
# Be sure to run `pod spec lint MHVerticalTabBarController.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "MHVerticalTabBarController"
  s.version      = "0.8"
  s.summary      = "MHVerticalTabBarController is a custom vertical tab bar controller that works on iPhone and iPad and allows easy customization."
  s.homepage     = "https://github.com/mwhuss//MHVerticalTabBarController"
  s.author       = { "Marshall Huss" => "mwhuss@gmail.com" }
  s.source       = { :git => "https://github.com/mwhuss//MHVerticalTabBarController.git", :tag => "0.8" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.requires_arc = true
end
