json.request params.as_json.delete_if {|k, v| %w(controller action).include? k}
json.error do |json|
  json.message 'this email already exists'
  json.parameter_name :email
  json.parameter_value @email_param
  json.redirect_to services_token_url + "?email=#{@email_param}"
end

