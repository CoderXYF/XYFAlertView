Pod::Spec.new do |s|

s.name = "XYFAlertView"

s.version = "1.2.2"

s.summary = "A simple, easy to use, variety of prompting operation frame"

s.homepage = "https://github.com/CoderXYF/XYFAlertView"

s.license = "MIT"

s.author = { "CoderXYF" => "2016003298@qq.com" }

s.platform = iOS, "8.0"

s.source = { :git => "https://github.com/CoderXYF/XYFAlertView.git", :tag => "1.2.2" }

s.source_files = "XYFAlertView/XYFAlertView/*.{h,m}"

s.framework ="UIKit"

s.dependency "MBProgressHUD"

s.dependency "AFNetworking"

s.xcconfig = {'HEADER_SEARCH_PATHS' =>'$(SDKROOT)/usr/include/libxml2'}

end
