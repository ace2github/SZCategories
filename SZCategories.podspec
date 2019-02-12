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


  s.default_subspec='SZCategories'

  s.subspec 'Safe' do |ss|
      ss.source_files = 'SZCategories/Sources/Safe/**/*'
  end

  s.subspec 'Thread' do |ss|
      ss.source_files = 'SZCategories/Sources/Thread/**/*'
  end

  s.subspec 'SZCategories' do |ss|
     ss.dependency 'SZCategories/Safe'
     ss.dependency 'SZCategories/Thread'
  end

end