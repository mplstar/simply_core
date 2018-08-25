class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private
  def parameter_missing(exception)
    @missing_param = exception.param
    # carefully choosing the response status code
    respond_to do |format|
      format.html { raise }
      format.json { render :parameter_missing, status: 422}
    end
  end
end
