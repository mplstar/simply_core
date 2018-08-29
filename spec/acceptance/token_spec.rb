require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Token" do
  let(:email) {  "test@gmail.com" }

  post 'services/token' do
    parameter :email, "a valid email adddress", required: true

    example "Restfully create token by email" do
      do_request
      expect(status).to eq 200
    end
  end

=begin
  get 'services/token' do
    parameter :email, "a valid email address", required: true
    before { Email.create(email: email) }

    example "Restfully fetch token by email" do
      example_request
      status.should == 200
    end
  end

  get 'services/token/create' do
    parameter :email, "a valid email address", required: true

    example "Bad way to create token by email" do
      example_request
      status.should == 200
    end
  end
=end
end

