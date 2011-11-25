require "test_helper"

module Intuit
  class ClientTest < ActiveSupport::TestCase
    setup do
      Client.token, Client.secret, Client.realm_id = "token", "secret", "realmID"
      Client.stubs(:consumer).returns(@consumer = stub)
      OAuth::AccessToken.stubs(:new).with(@consumer, "token", "secret").
        returns(@client = stub)
    end

    test "setting credentials" do
      assert_equal "token", Client.token
      assert_equal "secret", Client.secret
      assert_equal "realmID", Client.realm_id
    end

    test "get request token" do
      @consumer.expects(:get_request_token).with(:oauth_callback => "/url").
        returns(token = stub)
      assert_equal token, Client.request_token("/url")
    end

    test "client" do
      assert_equal @client, Client.client
    end

    test "menu" do
      Client.client.expects(:get).with("https://appcenter.intuit.com/api/v1/Account/AppMenu").
        returns(stub(:body => "html"))
      assert_equal "html", Client.menu
    end
  end
end
