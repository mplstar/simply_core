class TokenController < ApplicationController
  before_action :require_email_param, only: [:create, :get]

  ### the HTTP status code are carefully chosen
  def create   ## no error handling here, seperation of responsibilities
    begin
      @email = Email.create(email: @email_param)   ## instance variable for seperation of views
      ## send out registration email asynchronously...
      AccountMailer.delay(queue: "registration").registration_email(@email.email, @email.token)
      render json: {email: @email.email, token: @email.token}
    rescue ActiveRecord::RecordNotUnique => e
      render :duplicate_email, status: 400 ## carefully choose the response status
    end
  end

  ### the HTTP status code are carefully chosen
  def get   ## no error handling here, seperation of responsibilities
    @email = Email.find_by_email(@email_param)  ## instance variable for jbuilder
    if @email
      ## send out registration email asynchronously...
      AccountMailer.delay(queue: "reminder").registration_email(@email.email, @email.token)
      render json: {email: @email.email, token: @email.token}
    else
      render json: {email: @email_param, error: "not found"}, status: 404
    end
  end

  private
  def require_email_param
    ## handle missing parameter in application controller
    @email_param = params.require(:email) ## do not handle error here, important!
  end
end
