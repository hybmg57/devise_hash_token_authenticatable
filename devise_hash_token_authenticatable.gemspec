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

  s.add_dependency('devise', '~> 2.0')













#:TODO list dependancies

  s.add_development_dependency('rake', '>= 0.9')
  s.add_development_dependency('rdoc', '>= 3')
  s.add_development_dependency('rails', '~> 3.2')
  s.add_development_dependency('sqlite3')
end
