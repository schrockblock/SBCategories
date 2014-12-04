#
# Be sure to run `pod lib lint SBCategories.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SBCategories"
  s.version          = "0.1.1"
  s.summary          = "SBCategories contains iOS convenince categories, because sometimes it makes no sense the way Obj-C does things."
  s.description      = <<-DESC
                       Contains two categories (at the moment):
                       
                       * NSDictionary+ValueCheck which determines if the dict has a non NSNull value for the given key
                       * NSArray+Reverse returns an array that is ordered opposite to the given one
                       DESC
  s.homepage         = "https://github.com/schrockblock/SBCategories"
  s.license          = 'MIT'
  s.author           = { "Elliot" => "ephherd@gmail.com" }
  s.source           = { :git => "https://github.com/schrockblock/SBCategories.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/schrockblock'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'SBCategories' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
