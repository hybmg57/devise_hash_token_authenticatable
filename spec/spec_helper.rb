ENV["RAILS_ENV"] = "test"

require File.expand_path("rails_app/config/environment.rb",  File.dirname(__FILE__))
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
end

def default_devise_settings!
  ::Devise.hash_id = :hash_id
  ::Devise.hash_key = :hash_key
end
