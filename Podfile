# Uncomment the next line to define a global platform for your project
platform :ios, '15.5'

target 'Pokedex' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Pokedex

end

target 'PokedexUnitTests' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Pokedex UnitTests
  pod "SwiftyMocky"
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.5'
    end
  end
end
