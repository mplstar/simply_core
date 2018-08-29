require 'rails_helper'

describe TokenController do

  describe "POST 'services/token'" do
    it "returns http success" do
      post 'create', params: { email: "abc@xyz.com" }
      expect(response).to be_success
    end
  end

end
