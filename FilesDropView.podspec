#
# Be sure to run `pod lib lint FilesDropView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FilesDropView'
  s.version          = '0.1.0'
  s.summary          = 'A files drop view for macOS (OSX). Easy to use, customizable, and functional out of box.'

  s.description      = <<-DESC
A files drop view for macOS (OSX).
It's Easy to use, customizable, and functional out of box.
                       DESC

  s.homepage         = 'https://github.com/zzdjk6/FilesDropView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zzdjk6' => 'zzdjk6@126.com' }
  s.source           = { :git => 'https://github.com/zzdjk6/FilesDropView.git', :tag => s.version.to_s }

  s.platform = :osx
  s.osx.deployment_target = '10.10'
  s.source_files = 'FilesDropView/Classes/**/*'
  s.frameworks = 'Cocoa'
end
