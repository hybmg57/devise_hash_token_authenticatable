require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    # Strategy for api access, based on a hash token.
    # the hash token is used by passing a hash_id and a hash_key that is a hash of all url params before the hash_key itself
    #
    # Working example:
    # I need api access to https://myapp.example.com/contacts?sort_by=last_name&search_param=Smith
    # and I have a user id of:55
    # and I have generated a hash_token of : 3c5abf29fafe6e528f88391f034f013ffff17b38acf49b9cc43f28f09d8101f2
    # first I create a string that contains the path and query string
    # then I add my hash_id and hash_key
    # for example: contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=3c5abf29fafe6e528f88391f034f013ffff17b38acf49b9cc43f28f09d8101f2
    # then I generate the sha256 of the request string
    # for example: 4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d
    # then I replace the hash_key with the sha256 hash
    # for example: /contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d
    # then I should be able to make my request as:
    # https://myapp.example.com/contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d
    class HashTokenAuthenticatable < Authenticatable

      def store?
				false
      end

			def valid?
				params.include?(Devise::hashtoken_id) && params.include?(Devise::hashtoken_key)
			end

      def authenticate!
        hash_path = request.original_fullpath.gsub(/#{params[Devise::hashtoken_key]}.*/,'')
        resource = mapping.to.authenticate_with_hash_token(hash_path, params[Devise::hashtoken_id], params[Devise::hashtoken_key])
        return fail(:invalid) if resource.nil?
        unless resource.nil?
          resource.after_hash_token_authentication
          success!(resource)
        else
          fail(:invalid)
        end
      end
    end
  end
end

Warden::Strategies.add(:hash_token_authenticatable, Devise::Strategies::HashTokenAuthenticatable)
