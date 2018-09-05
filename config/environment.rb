# Load the Rails application.
require File.expand_path('../application', __FILE__)

simply_core_env = File.join(Rails.root, 'config', 'simply_core_env.rb')
load(simply_core_env) if File.exists?(simply_core_env)

# Initialize the Rails application.
SimplyCore::Application.initialize!
