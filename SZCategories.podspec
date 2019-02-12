Pod::Spec.new do |s|
  s.name         = "SZCategories"
  s.version      = "0.0.1"
  s.summary      = "SZCategories 是基础工具类库"

  s.description  = <<-DESC
    SZCategories常用的类别整理
                   DESC

  s.homepage     = "https://github.com/ace2github/SZCategories"
  s.license      = 'MIT'

  s.author             = { "ChaohuiChen" => "173141667@qq.com" }

  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/ace2github/SZCategories.git", :tag => s.version }

 # s.source_files = 'SZBase/SZBase/Sources/**/*'

  s.default_subspec='SZBaseFoundation'

  s.subspec 'SZEasyRouter' do |ss|
      ss.source_files = 'SZBase/SZBase/Sources/SZEasyRouter/**/*'
  end

  s.subspec 'SZWeekPool' do |ss|
      ss.source_files = 'SZBase/SZBase/Sources/SZWeekPool/**/*'
  end

  s.subspec 'SZMultiDelegate' do |ss|
      ss.source_files = 'SZBase/SZBase/Sources/SZMultiDelegate/**/*'
      ss.dependency 'SZBase/SZWeekPool'
  end

  s.subspec 'SZRWLock' do |ss|
      ss.source_files = 'SZBase/SZBase/Sources/SZRWLock/**/*'
  end

  s.subspec 'SZBaseFoundation' do |ss|
     ss.dependency 'SZBase/SZWeekPool'
     ss.dependency 'SZBase/SZMultiDelegate'
     ss.dependency 'SZBase/SZEasyRouter'
     ss.dependency 'SZBase/SZRWLock'
  end

end