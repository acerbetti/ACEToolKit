Pod::Spec.new do |s|
  s.name         = 'ACEToolKit'
  s.version      = '0.3.3'
  s.homepage     = 'https://github.com/acerbetti/ACEToolKit'
  s.author       = { 'Stefano Acerbetti' => 'acerbetti@gmail.com' }
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = 'Development tools to make my life (and yours) a little bit easier.'
  s.source       = { :git => 'https://github.com/acerbetti/ACEToolKit.git', :tag => "v#{s.version}" }
  s.source_files = 'ACEToolKit/*.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '8.0'
  s.ios.dependency 'FFGlobalAlertController'

  s.osx.deployment_target = '10.7'
  s.osx.exclude_files = 'ACEToolKit/ACEActionSheet.*',
                        'ACEToolKit/ACEAlertView.*',
                        'ACEToolKit/ACEErrorUtils.*',
                        'ACEToolKit/ACENavigationController.*'

end
