# YhsdPrivateApp

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yhsd_private_app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yhsd_private_app

## Usage

1.配置app_key和app_secret

  第一种方法：
  
    YhsdPrivateApp::Config.initialize_connect({:app_key => your app key, :app_secret => you app secret})
  
  第二种方法：
  
    YhsdPrivateApp::Config.load(yml配置文件目录)
  
2.获取access_token

  调用YhsdPrivateApp::generate_access_token获取到token后存放到本地数据库中
    
    YhsdPrivateApp:HTTP.access_token = your token
  
3.youhaosuda api接口调用

  (1) get 方法
  
    YhsdPrivateApp::HTTP.api_get(request_path)
    
  (2) post 方法
  
    YhsdPrivateApp::HTTP.post(request_path, params)
    
  (3) put 方法
  
    YhsdPrivateApp::HTTP.put(request_path, params)
    
  (4) delete 方法
  
    YhsdPrivateApp::HTTP.put(request_path)


## Contributing

1. Fork it ( https://github.com/[my-github-username]/yhsd_private_app/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request