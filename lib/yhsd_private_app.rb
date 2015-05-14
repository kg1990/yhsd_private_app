require "yhsd_private_app/version"
require 'base64'
require 'json'

module YhsdPrivateApp
  # Your code goes here...

  # Your code goes here...

  require 'yhsd_private_app/config'
  require 'yhsd_private_app/http'

  class << self

    def generate_access_token
      app_key, app_secret = Config.settings[:app_key], Config.settings[:app_secret]
      content = "#{app_key}:#{app_secret}"
      encode = Base64.encode64(content).delete("\n\r")
      authorization = "Basic #{encode}"

      req_body = {
        "grant_type" => Config.settings[:grant_type]
      }

      opts = {
        :headers =>{
          "Authorization" => authorization,
          "content_type" => Config.settings[:content_type]
        }
      }
      
      code, body, header = HTTP::post(Config.settings[:auth_url], req_body, opts)
      if code == 200
        JSON.parse(body)["token"]
      else
        raise Exception.new(body)
      end
    end

  end
end
