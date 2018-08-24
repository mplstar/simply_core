class TokenController < ApplicationController
  before_action :require_email_param, only: [:create, :get]

  def create
    if @email_param.nil?
      render json: {email: @email_param, error: "bad email" }, status: 400
    else
      data = Email.create(email: @email_param)
      if data
        render json: {email: data.email, token: data.token}
      else
        render json: {email: @email_param}, status: 500  ## server error
      end
    end
  end

  def get
    if @email_param.nil?
      render json: {email: @email_param, error: "bad email" }, status: 400
    else
      data = Email.find_by_email(@email_param)
      if data
        render json: {email: data.email, token: data.token}
      else
        render json: {email: @email_param, error: "not found"}, status: 404
      end
    end
  end

  private
  def require_email_param
    @email_param = params.require(:email) ## do not handle error here, important!
  end
end
