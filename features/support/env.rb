ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../../spec/rails_app/config/environment.rb",  __FILE__)
#require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails'
require 'bundler'

require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
#require 'cucumber/rails/capybara_javascript_emulation'
require 'devise_hash_token_authenticatable'
require 'rspec/expectations'

Capybara.default_selector = :css
Capybara.save_and_open_page_path = File.join('/tmp')
#ActionController::Base.allow_rescue = false
Cucumber::Rails::World.use_transactional_fixtures = true
if defined?(ActiveRecord::Base)
  begin
    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation
  rescue LoadError => ignore_if_database_cleaner_not_present
  end
end
