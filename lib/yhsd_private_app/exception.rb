module YhsdPrivateApp

  class MissingConfigFile < Exception

    def initialize(file)
      super("yhsd_private_app config file #{file} not exist.")
    end

  end

  class MissingConfigKey < Exception

    def initialize(key)
      super("yhsd_private_app config #{key} must exist and can not be blank.")
    end

  end

  class MissingAccessToken < Exception

    def initialize
      super('access token is not exist.')
    end
    
  end

end