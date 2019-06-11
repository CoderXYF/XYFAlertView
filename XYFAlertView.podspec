Pod::Spec.new do |s|

s.name = "XYFAlertView"

s.version = "1.4.0"

s.summary = "A simple, easy to use, variety of prompting operation frame"

s.description = <<-DESC
A simple, easy to use, variety of prompting operation frame for ios platform, which is also safe
DESC

s.homepage = "https://github.com/CoderXYF/XYFAlertView"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "CoderXYF" => "2016003298@qq.com" }

s.platform = :ios, '8.0'

s.requires_arc = true

s.source = { :git => "https://github.com/CoderXYF/XYFAlertView.git", :tag => "1.4.0" }

s.source_files = "XYFAlertView/XYFAlertView/*.{h,m}"

s.resource_bundles = {
    'XYFAlertView' => ['XYFAlertView/XYFAlertView/Images/*']
}

s.framework = "UIKit"

s.dependency "MBProgressHUD"

s.dependency "AFNetworking"

end
