ENV["RAILS_ENV"] = "test"

require File.expand_path('../rails_app/config/environment.rb',  __FILE__)
require 'rspec'
require 'rspec/rails'
require 'factory_girl'
require 'rails/test_help'

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}


Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
end

def default_devise_settings!
  ::Devise.hashtoken_id = :hash_id
  ::Devise.hashtoken_key = :hash_key
end
