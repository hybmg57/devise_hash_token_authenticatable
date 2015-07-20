# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise_hash_token_authenticatable/version"

Gem::Specification.new do |s|
  s.name     = 'devise_hash_token_authenticatable'
  s.version  = DeviseHashTokenAuthenticatable::VERSION.dup
  s.platform = Gem::Platform::RUBY
  s.summary  = 'Devise extension to allow authentication via hash token'
  s.email = 'curtis.schiewek@gmail.com'
  s.homepage = 'https://github.com/cschiewek/devise_hash_token_authenticatable'
  s.description = s.summary
  s.authors = ['Shane Davies']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('devise', '~> 3.4.1')

  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('rails', '~> 3.2.18')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('ruby-prof')
  s.add_development_dependency('factory_girl_rails')
  s.add_development_dependency('factory_girl')
  s.add_development_dependency('shoulda')
  s.add_development_dependency('rspec-rails')
  s.add_development_dependency('mocha')
  s.add_development_dependency('database_cleaner')
  s.add_development_dependency('cucumber-rails')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('capybara')
  s.add_development_dependency('launchy')
end
