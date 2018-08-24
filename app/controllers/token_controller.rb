class TokenController < ApplicationController
  def create
    email = params[:email]
    if email.nil?
      @user_error = 'email is empty'
      render action: 'bad_request'
    else
      render json: {welcome: email}
    end
  end

  def bad_request  ## client error 400
    render json: {error: @user_error}, status: 400
  end
end
