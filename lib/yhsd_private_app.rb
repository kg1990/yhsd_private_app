require 'base64'
require 'json'
require 'yaml'
require "yhsd_private_app/version"
require 'yhsd_private_app/exception'
require 'yhsd_private_app/config'
require 'yhsd_private_app/http'

module YhsdPrivateApp
  # Your code goes here...

  class << self

    def generate_access_token
      
      req_body = {
        "grant_type" => 'client_credentials'
      }

      opts = {
        :headers =>{
          "Authorization" => generate_authorization,
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

    def generate_authorization
      app_key, app_secret = Config.settings[:app_key], Config.settings[:app_secret]
      content = "#{app_key}:#{app_secret}"
      encode = Base64.encode64(content).delete("\n\r")
      "Basic #{encode}"
    end

  end
end
