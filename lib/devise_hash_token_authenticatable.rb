# encoding: utf-8
require 'devise'

require 'devise_hash_token_authenticatable/exception'
require 'devise_hash_token_authenticatable/logger'
require 'devise_hash_token_authenticatable/schema'
require 'devise_hash_token_authenticatable/routes'

module Devise
  mattr_accessor :hash_token_logger
  @@hash_token_logger = true
end

# Add hash_token_authenticatable strategy to defaults.
#
Devise.add_module(:hash_token_authenticatable,
                  route: :session,
                  strategy: true,
                  controller: :sessions,
                  model: 'devise_hash_token_authenticatable/model')
