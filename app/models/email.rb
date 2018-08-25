class Email < ActiveRecord::Base
  before_create :generate_token
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "invalid format" }

  private
  def generate_token
    self.token = SecureRandom.hex
  end
end
