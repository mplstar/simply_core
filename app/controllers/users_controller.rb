class UsersController < ApplicationController
  def register
    @email = Email.find_by_token(params[:token]) or raise ActionController::RoutingError.new('Not Found')
  end
end
