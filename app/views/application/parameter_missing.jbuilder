json.request params.as_json.delete_if {|k, v| %w(controller action).include? k}
json.error do |json|
  json.message 'required parameter missing'
  json.parameter_name @missing_param
end

