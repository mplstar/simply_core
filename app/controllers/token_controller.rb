class TokenController < ApplicationController
  before_action :require_email_param, only: [:create, :get]

  ### the HTTP status code are carefully chosen
  def create   ## no error handling here, seperation of responsibilities
    @email = Email.create(email: @email_param)   ## instance variable for seperation of views
    if @email.errors.empty?
      render json: {email: @email.email, token: @email.token}
    elsif @email.errors.get(:email).present?
      render json: {email: @email_param, error: @email.errors.get(:email).first }, status: 400
    else
      render json: {email: @email_param}, status: 500  ## server error
    end
  end

  ### the HTTP status code are carefully chosen
  def get   ## no error handling here, seperation of responsibilities
    @email = Email.find_by_email(@email_param)  ## instance variable for jbuilder
    if @email
      render json: {email: @email.email, token: @email.token}
    else
      render json: {email: @email_param, error: "not found"}, status: 404
    end
  end

  private
  def require_email_param
    @email_param = params.require(:email) ## do not handle error here, important!
    ## TODO: need general error handler for missing parameters, do not handle missing parameter in individual controllers
  end
end
