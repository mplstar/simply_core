json.request params.as_json.delete_if {|k, v| %w(controller action).include? k}
json.error do |json|
  if @email.errors.has_key?(:email)
    json.message 'cannot save email'
    json.parameter_name :email
    json.parameter_value @email_param
    json.error_details @email.errors.get(:email)
  else
    json.message @email.errors.full_messages
  end
end
