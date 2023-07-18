#
#  Be sure to run `pod spec lint RCTPili.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "RCTUnionPay"
  s.version      = package['version']
  s.summary      = "React-Native(iOS/Android) 云闪付支付"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                  React-Native(iOS/Android) 云闪付支付
                   DESC

  s.homepage     = "https://github.com/ShaoGongBra/react-native-unionpay"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "ShaoGongBra" => "908634674@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ShaoGongBra/react-native-unionpay.git", :tag => "master" }
  s.source_files  = "**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"
  s.vendored_libraries = "ios/paymentcontrol/libs/*.a"
  s.ios.frameworks = 'CFNetwork','SystemConfiguration'

end
