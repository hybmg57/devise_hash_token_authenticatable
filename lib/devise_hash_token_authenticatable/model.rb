require 'devise_hash_token_authenticatable/strategy'
module Devise
  module Models
    # HashToken Module, responsible for validating the api credentials via hash token
    #
    module HashTokenAuthenticatable
      extend ActiveSupport::Concern

      # Hook called after hash_token authentication.
      def after_hash_token_authentication
      end

      def gen_hash_key
        self[::Devise.hashtoken_key] = Digest::SHA256.hexdigest([self.id, Time.now.to_i].join)
      end

      def default_hash_key
        self.gen_hash_key if self[::Devise.hashtoken_key].blank?
      end

      module ClassMethods
        # Authenticate a api request based on hash token
        # authenticated user if it's valid or nil.
        def authenticate_with_hash_token(param_path = nil, param_hash_id = nil, param_hash_key = nil)
          resource = find_by_id param_hash_id
          resource = nil if resource.blank? || param_hash_key != Digest::SHA256.hexdigest(param_path + resource[::Devise.hashtoken_key])
          resource
        end
      end
    end
  end
end



