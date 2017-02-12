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
  s.summary          = 'A short description of FilesDropView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zzdjk6@126.com/FilesDropView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zzdjk6@126.com' => 'zzdjk6@gmail.com' }
  s.source           = { :git => 'https://github.com/zzdjk6@126.com/FilesDropView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/zzdjk6'

  s.platform = :osx
  s.osx.deployment_target = '10.10'
  s.source_files = 'FilesDropView/Classes/**/*'
  s.frameworks = 'Cocoa'
end
