#
#  Be sure to run `pod spec lint ZProgress.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ZProgress"
  s.version      = "0.0.2"
  s.summary      = "ZProgress是一款自定义非常方便的进度条控件"

  s.description  = <<-DESC
                        ZProgress是一款自定义非常方便的进度条控件, 支持横向,纵向,圆形等展示方式,简单, 高效, 样式丰富.
                   DESC

  s.homepage     = "https://github.com/zhuayi/ZProgress"
  s.screenshots  = "https://raw.githubusercontent.com/zhuayi/ZProgress/master/screenshots/screenshots_1.gif", "https://raw.githubusercontent.com/zhuayi/ZProgress/master/screenshots/screenshots_2.gif", "https://raw.githubusercontent.com/zhuayi/ZProgress/master/screenshots/screenshots_3.gif"


  s.license          = 'MIT'
  s.author           = { "zhuayi" => "2179942@qq.com" }
  s.source           = { :git => "https://github.com/zhuayi/ZCamera.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

s.source_files = 'Classes/**/*{h,m}'
  s.public_header_files = 'Classes/**/*.h'

end
