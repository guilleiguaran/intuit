module Intuit
  module Integration
    class TestCase < ActiveSupport::TestCase
      setup do
        Intuit.oauth_consumer_key    = "qyprdVNOWmuydSFjnuvMNrcVlX55Gr"
        Intuit.oauth_consumer_secret = "o67aShjgcfLBdgEDpZNTuM6bgUar2FvceB2lJq65"
        Intuit.app_token             = "674bfd69b279eb43e8b9162ba4bc8ebcfbc9"

        Client.token    = "qyprd4LnGPxj1Vr1HcUmi54lNzepZgv7PEDVFvCF7Ix9cqi4"
        Client.secret   = "1curCpT7tUmvVUlDJR4jR7b7niWvnvtGidB9J7Xv"
        Client.realm_id = "176849307"
      end

      teardown do
        Client.token, Client.secret, Client.realm_id = nil
      end
    end
  end
end
