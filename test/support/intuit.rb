module Intuit
  module Integration
    class TestCase < ActiveSupport::TestCase
      setup do
        Intuit.oauth_consumer_key    = "qyprdVNOWmuydSFjnuvMNrcVlX55Gr"
        Intuit.oauth_consumer_secret = "o67aShjgcfLBdgEDpZNTuM6bgUar2FvceB2lJq65"
        Intuit.app_token             = "674bfd69b279eb43e8b9162ba4bc8ebcfbc9"

        Client.token    = "qyprdtmj4Lk7bPYTM3myAHBK69GLswWVIaLoG4gE6LgF0odw"
        Client.secret   = "9bnXn9Xi8xCrPn9MEgyied971Zd1MIgnrLSjs4at"
        Client.realm_id = "312088315"
      end

      teardown do
        Client.token, Client.secret, Client.realm_id = nil
      end
    end
  end
end
