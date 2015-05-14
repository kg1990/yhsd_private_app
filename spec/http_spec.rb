require 'spec_helper'

module YhsdPrivateApp

  describe HTTP do

    before(:each) do
      YhsdPrivateApp::Config.initialize_connect!(
        {
          :app_key => '5c95892f62ce423a90726560f2de14f2', 
          :app_secret => '33e910c2dbcd4f44881ad1d2c53ec2f8', 
          :auth_url => 'http://apps.localtest.com/oauth2/token', 
          :api_host => "http://api.public.com/v1/"
        }
      )
      YhsdPrivateApp::HTTP.access_token = YhsdPrivateApp.generate_access_token
      @api_host = YhsdPrivateApp::Config.settings[:api_host]
    end

    context "access_token is blank" do
      it "raises" do
        YhsdPrivateApp::HTTP.access_token = ''
        path = "products"
        expect {code, body, header = YhsdPrivateApp::HTTP.api_get(@api_host + path)}.to raise_error(MissingAccessToken)
      end
    end

    context "get" do
      it "should works" do
        path = "products"
        code, body, header = YhsdPrivateApp::HTTP.api_get(@api_host + path)
        puts code, body, header
      end
    end

    context "get id" do
      it "should works" do
        path = "products/723"
        code, body, header = YhsdPrivateApp::HTTP.api_get(@api_host + path)
        puts code, body, header
      end
    end

    # context "delete" do
    #   it "should works" do
    #     path = "products/721"
    #     code, body, header = YhsdPrivateApp::HTTP.delete(@api_host + path, @header)
    #     puts code, body, header
    #   end
    # end

    context "post" do
      it "should works" do
        path = "products/723/variants"
        body = {
          "variant": {
            "option_1": "白",
            "option_2": "萝卜",
            "option_3": "XXL",
            "price": 10,
            "compare_price": 0,
            "stock": 9,
            "weight": 4,
            "volume": 1,
            "barcode": "",
            "image_id": nil
          }
        }
        code, body, header = YhsdPrivateApp::HTTP.api_post(@api_host + path, body)
        puts code, body, header
      end
    end

    context "put" do
      it "should works" do
        path = "products/723/variants/1023"
        body = {
          "variant": {
            "option_1": "白==",
            "option_2": "萝卜",
            "option_3": "XXL",
            "price": 10,
            "compare_price": 0,
            "stock": 9,
            "weight": 4,
            "volume": 1,
            "barcode": "",
            "image_id": nil
          }
        }
        code, body, header = YhsdPrivateApp::HTTP.api_put(@api_host + path, body)
        puts code, body, header
      end
    end

  end
end