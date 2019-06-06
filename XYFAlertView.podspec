Pod::Spec.new do |s|

s.name = "XYFAlertView"

s.version = "1.1.1"

s.ios.deployment_target = '8.0'

s.summary = "A simple, easy to use, variety of prompting operation frame"

s.homepage = "https://github.com/CoderXYF/XYFAlertView"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "CoderXYF" => "2016003298@qq.com" }

s.source = { :git => "https://github.com/CoderXYF/XYFAlertView.git", :tag => s.version }

s.source_files = "XYFAlertView/XYFAlertView/*.{h,m}"

s.dependency "MBProgressHUD"

s.requires_arc = true

s.xcconfig = {'HEADER_SEARCH_PATHS' =>'$(SDKROOT)/usr/include/libxml2'}

end
