Pod::Spec.new do |s|
  s.name             = 'PSEmptyView'
  s.version          = "1.0.0"
  s.summary          = 'A drop-in empty view solution.'
  s.description      = <<-DESC
                      A drop-in empty view solution.Ease use and quick compose.
                       DESC

  s.homepage         = 'https://github.com/DeveloperPans/PSEmptyView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DeveloperPans' => 'shengpann@163.com' }
  s.source           = { :git => 'https://github.com/DeveloperPans/PSEmptyView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://shengpan.net'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PSEmptyView/Classes/**/*'
  s.frameworks = 'UIKit'

end
