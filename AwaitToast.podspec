Pod::Spec.new do |s|
  s.name         = "AwaitToast"
  s.version      = "1.2.0"
  s.summary      = "🍞 An async waiting toast with basic toast. Inspired by facebook posting toast."
  s.homepage     = "https://github.com/k-lpmg/AwaitToast"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "DongHee Kang" => "kanglpmg@gmail.com" }
  s.source       = { :git => "https://github.com/k-lpmg/AwaitToast.git", :tag => s.version.to_s }
  s.documentation_url = "https://github.com/k-lpmg/AwaitToast/blob/master/README.md"

  s.ios.source_files  = "Sources/**/*.swift"
  s.ios.deployment_target = "9.0"
end
