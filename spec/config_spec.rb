require 'spec_helper'

module YhsdPrivateApp

  describe Config do

    before(:each) do
      
    end

    context "init with yml file" do
      it "should works" do
        YhsdPrivateApp::Config.load(File.expand_path('../..', __FILE__) + '/spec/config/yhsd_private_app.yml')
      end
    end

    context "init with code" do
      it "should works" do
        YhsdPrivateApp::Config.initialize_connect!(
          {
            :app_key => '5c95892f62ce423a90726560f2de14f2', 
            :app_secret => '33e910c2dbcd4f44881ad1d2c53ec2f8', 
            :auth_url => 'http://apps.localtest.com/oauth2/token', 
            :api_host => "http://api.public.com/v1/"
          }
        )
      end
    end

    context "init blank key" do
      it "should raise error" do
        expect{
          YhsdPrivateApp::Config.initialize_connect!(
            {
              :app_key => '', 
              :app_secret => '33e910c2dbcd4f44881ad1d2c53ec2f8', 
              :auth_url => 'http://apps.localtest.com/oauth2/token', 
              :api_host => "http://api.public.com/v1/"
            }
          )
          }.to raise_error(MissingConfigKey)
      end
    end

    context "init blank key" do
      it "should raise error" do
        expect{
          YhsdPrivateApp::Config.initialize_connect!(
            {
              :app_key => '5c95892f62ce423a90726560f2de14f2', 
              :app_secret => '', 
              :auth_url => 'http://apps.localtest.com/oauth2/token', 
              :api_host => "http://api.public.com/v1/"
            }
          )
          }.to raise_error(MissingConfigKey)
      end
    end

    context "init blank key" do
      it "should raise error" do
        expect{
          YhsdPrivateApp::Config.initialize_connect!(
            {
              :app_key => '5c95892f62ce423a90726560f2de14f2', 
              :app_secret => '33e910c2dbcd4f44881ad1d2c53ec2f8', 
              :auth_url => '', 
              :api_host => "http://api.public.com/v1/"
            }
          )
          }.to raise_error(MissingConfigKey)
      end
    end

    context "init blank key" do
      it "should raise error" do
        expect{
          YhsdPrivateApp::Config.initialize_connect!(
            {
              :app_key => '5c95892f62ce423a90726560f2de14f2', 
              :app_secret => '33e910c2dbcd4f44881ad1d2c53ec2f8', 
              :auth_url => 'http://apps.localtest.com/oauth2/token', 
              :api_host => ""
            }
          )
          }.to raise_error(MissingConfigKey)
      end
    end

    context "init blank yml" do
      it "should raise error" do
        expect{
          YhsdPrivateApp::Config.load(File.expand_path('../..', __FILE__) + '/spec/config/yhsd_private_app_error.yml')
          }.to raise_error(MissingConfigKey)
      end
    end

    context "init blank yml" do
      it "should raise error" do
        expect{
          YhsdPrivateApp::Config.load(File.expand_path('../..', __FILE__) + '/spec/config/no_file.yml')
          }.to raise_error(MissingConfigFile)
      end
    end

  end

end