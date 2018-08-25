require 'spec_helper'

describe TokenController do

  describe "POST 'services/token'" do
    it "returns http success" do
      post 'create', { email: "abc@xyz.com" }
      response.should be_success
    end
  end

end
