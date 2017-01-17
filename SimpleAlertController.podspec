Pod::Spec.new do |s|

  s.name         = "SimpleAlertController"
  s.version      = "0.3.0"
  s.summary      = "Very simple alert controller written in Swift."
  s.description  = <<-DESC
                   SimpleAlertController is similar to UIAlertController. It is written in Swift.
                   DESC

  s.homepage     = "https://github.com/ton-katsu/SimpleAlertController"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "ton-katsu" => "sakamoto.yoshihisa@gmail.com" }

  s.source       = { :git => "https://github.com/ton-katsu/SimpleAlertController.git", :tag => s.version }

  s.source_files = "SimpleAlertController/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

end
