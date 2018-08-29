require 'rails_helper'

describe UsersController do
  fixtures :emails
  let(:email) { emails(:one) }

  describe "GET 'register'" do
    context 'when token is not correct' do
      it "raises Routing error" do
        expect {get 'register', params: {token: '12345'}}.to raise_error(ActionController::RoutingError)
      end
    end

    context 'when token is correct' do
      it "returns http success" do
        get 'register', params: {token: email.token}
        expect(response).to be_success
      end
    end
  end

end
