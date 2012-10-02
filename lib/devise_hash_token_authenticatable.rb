# encoding: utf-8
require 'devise'

require 'devise_hash_token_authenticatable/exception'
require 'devise_hash_token_authenticatable/logger'

module Devise
  mattr_accessor :hashtoken_id
  @@hashtoken_id = :hash_id

  mattr_accessor :hashtoken_key
  @@hashtoken_key = :hash_key
end

# Add hash_token_authenticatable strategy to defaults.
#
Devise.add_module(:hash_token_authenticatable,
                  route: :session,
                  strategy: true,
                  controller: :sessions,
                  model: 'devise_hash_token_authenticatable/model')
