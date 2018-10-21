# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


use_frameworks!
def common_pods
    pod 'Alamofire', '~> 4.5'
    pod 'RxAlamofire', '~> 4.0'
    pod 'RxSwift', '~> 4.0'
    pod 'RxCocoa', '~> 4.0'
    pod 'SDWebImage', '~> 4.0'
    pod 'SwiftyJSON'
    pod 'AlamofireObjectMapper'
    pod 'RealmSwift'

end

target 'ScholarApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

   common_pods
  
  # Pods for ScholarApp

  target 'ScholarAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ScholarAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
