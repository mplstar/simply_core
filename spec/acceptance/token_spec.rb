require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Token" do
  let(:email) {  "test@gmail.com" }

  post 'services/token' do
    parameter :email, "a valid email adddress", required: true

    example "Restfully create token by email" do
      do_request
      expect(status).to eq(200)
      resp = JSON.parse(response_body)
      # expect(resp['tags'].size).to eq(2)
    end
  end

  get 'services/token' do
    parameter :email, "a valid email address", required: true
    before { Email.create(email: email) }

    example_request "Restfully fetch token by email" do
      expect(status).to eq(200)
    end
  end

  get 'services/token/create' do
    parameter :email, "a valid email address", required: true

    example_request "Bad way to create token by email" do
      expect(status).to eq 200
    end
  end
end

