Pod::Spec.new do |s|

  s.name         = 'ACEToolKit'
  s.version      = '0.3.4'
  s.homepage     = 'https://github.com/acerbetti/ACEToolKit'
  s.summary      = 'Development tools to make my life (and yours) a little bit easier.'
  s.author       = { 'Stefano Acerbetti' => 'acerbetti@gmail.com' }
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.source       = { :git => 'https://github.com/acerbetti/ACEToolKit.git', :tag => "v#{s.version}" }
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.7'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|
  
    ss.ios.deployment_target = '8.0'
    ss.ios.dependency 'FFGlobalAlertController'
    ss.source_files = 'ACEToolKit/*.{h,m}'
    ss.requires_arc = true

    ss.osx.deployment_target = '10.7'
    ss.osx.exclude_files =  'ACEToolKit/ACEActionSheet.*',
                            'ACEToolKit/ACEAlertView.*',
                            'ACEToolKit/ACEErrorUtils.*',
                            'ACEToolKit/ACENavigationController.*'
  end

  s.subspec 'AppExtension' do |ss|

    ss.ios.deployment_target = '8.0'
    ss.source_files =   'ACEToolKit/*.{h,m}'
    ss.exclude_files =  'ACEToolKit/ACEActionSheet.*',
                        'ACEToolKit/ACEAlertView.*',
                        'ACEToolKit/ACEErrorUtils.*',
                        'ACEToolKit/ACENavigationController.*'
    ss.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ACE_APP_EXTENSION=1' }
    ss.requires_arc = true

  end

end
