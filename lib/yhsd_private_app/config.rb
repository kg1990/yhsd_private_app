module YhsdPrivateApp

  module Config

    class << self

      DEFAULT_OPTIONS = {
        :grant_type      => "client_credentials",
        :content_type    => 'application/x-www-form-urlencoded',
        :auth_url        => "https://apps.youhaosuda.com/oauth2/token/",
        :api_host        => "https://api.youhaosuda.com/v1",
        :app_key         => "",
        :app_secret      => ""
      }

      REQUIRED_OPTION_KEYS = [:app_key, :app_secret, :auth_url, :api_host]

      attr_reader :settings, :default_params

      def load config_file
        if File.exist?(config_file)
          config_options = YAML.load_file(config_file)
          config_options.symbolize_keys!
          initialize_connect!(config_options)
        else
          raise Exception.new("youhaosuda app config yml file is not exist")
        end
      end

      def initialize_connect! options = {}
        @settings = DEFAULT_OPTIONS.merge!(options)
        REQUIRED_OPTION_KEYS.each do |opt|
          raise Exception.new("Config key #{option} must exist!") unless @settings.has_key?(opt)
        end
      end

    end

  end
    
end 