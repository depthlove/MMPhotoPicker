
Pod::Spec.new do |s|
  s.name             = "MMPhotoPicker"
  s.version          = "1.1"
  s.summary          = "A photo picker used on iOS."
  s.homepage         = "https://github.com/CheeryLau/MMPhotoPicker"
  s.license          = 'MIT'
  s.author           = { "LEA" => "1625977078@qq.com" }
  s.source           = { :git => "https://github.com/CheeryLau/MMPhotoPicker.git", :tag => s.version}
  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.source_files     = 'MMPhotoPicker/**/*.{h,m}'
  s.resources        = 'MMPhotoPicker/**/MMPhotoPicker.bundle'
  s.frameworks       = 'Foundation', 'UIKit', 'Photos'

end
