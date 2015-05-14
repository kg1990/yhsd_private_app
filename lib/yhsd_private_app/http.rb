require 'rest-client'

module YhsdPrivateApp

  class HTTP

    class << self
      
      public

      attr_accessor :access_token

      def get(url, opts = {})
        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end
        begin
          response = RestClient.get(url, req_headers)
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end
      end

      def post(url, req_body = nil, opts = {})
        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end
        
        begin
          response = RestClient.post(url, req_body, req_headers)
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end
      end

      def put(url, req_body = nil, opts = {})
        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end
        begin
          response = RestClient.put(url, req_body, req_headers)
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end
      end

      def delete(url, opts = {})
        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end
        begin
          response = RestClient.delete(url, req_headers)
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end
      end

      def api_get(url)
        validate_access_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @access_token
        }}

        get(url, opts)
      end

      def api_delete(url)
        validate_access_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @access_token
        }}

        delete(url, opts)
      end

      def api_post(url, req_body)
        validate_access_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @access_token,
          :content_type => :json,
          :accept => :json
        }}

        post(url, req_body.to_json, opts)
      end

      def api_put(url, req_body)
        validate_access_token
        
        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @access_token,
          :content_type => :json,
          :accept => :json
        }}

        put(url, req_body.to_json, opts)
      end

      def validate_access_token
        raise MissingAccessToken if @access_token.to_s.empty?
      end
    end

  end

end