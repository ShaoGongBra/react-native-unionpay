#
#  Be sure to run `pod spec lint RCTUnionPay.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RCTUnionPay"
  s.version      = package['version']
  s.summary      = "React-Native(iOS/Android) 云闪付支付SDK"
  s.description  = <<-DESC
  React-Native(iOS/Android) 云闪付支付SDK
   DESC
  s.author       = { "ShaoGongBra" => "908634674@qq.com" }
  s.homepage     = "https://github.com/ShaoGongBra/react-native-unionpay"
  s.license      = "MIT"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ShaoGongBra/react-native-unionpay.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.dependency "React-Core"
  s.vendored_libraries = "ios/paymentcontrol/libs/*.a"
  s.requires_arc = true
  s.frameworks = 'CFNetwork','SystemConfiguration'
end
