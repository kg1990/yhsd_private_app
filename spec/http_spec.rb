require 'spec_helper'

module YhsdPrivateApp

  describe HTTP do

    before(:each) do
      YhsdPrivateApp::HTTP.access_token = YhsdPrivateApp.generate_access_token
      @api_host = YhsdPrivateApp::Config.settings[:api_host]
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