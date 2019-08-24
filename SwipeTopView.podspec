
Pod::Spec.new do |spec|



  spec.name         = "SwipeTopView"
  spec.version      = "0.1.3"
  spec.summary      = "Top animation view"

  spec.description  = <<-DESC
          Animating top view
                   DESC

  spec.homepage     = "https://github.com/cinaryusufiu/SwipeTopView"
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Yusuf Cinar" => "cinaryusufiu@gmail.com" }
  spec.social_media_url   = "https://twitter.com/cinaryusufiu"
  spec.source       = { :git => "https://github.com/cinaryusufiu/SwipeTopView.git", :tag => "#{spec.version}" }

 spec.source_files = 'SwipeTopView/SwipeTopView.swift'
 spec.ios.deployment_target = '11.0'
end
