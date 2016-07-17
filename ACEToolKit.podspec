Pod::Spec.new do |s|

  s.name         = 'ACEToolKit'
  s.version      = '0.3.4'
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

  s.subspec 'AppExtension' do |ss|

    ss.ios.deployment_target = '8.0'
    ss.source_files = 'ACEToolKit/*.{h,m}'
    ss.exclude_files = 'ACEToolKit/ACEActionSheet.{m,h}', 
                       'ACEToolKit/ACEAlertView.{m,h}', 
                       'ACEToolKit/ACENavigationController.{m,h}', 
                       'ACEToolKit/ACETextLabel.{m,h}', 
                       'ACEToolKit/ACEErrorUtils.{m,h}'
    ss.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ACE_APP_EXTENSION=1' }
    ss.requires_arc = true
  end

end
