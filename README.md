Devise Hash Token Authenticatable
=================================
Devise Hash Token Authenticatable is a Token based authentication strategy for the [Devise](http://github.com/plataformatec/devise) authentication framework. It is specifically designed for server/client api access where there may not be a user available to generate temporary access token. In this case the access token is more permanent.

Working example:
---------------

I need api access to https://myapp.example.com/contacts?sort_by=last_name&search_param=Smith and I have a user id of:55 and I have generated a hash_token of : 3c5abf29fafe6e528f88391f034f013ffff17b38acf49b9cc43f28f09d8101f2

First I create a string that contains the path and query string
Second I add my hash_id and hash_key

    contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=3c5abf29fafe6e528f88391f034f013ffff17b38acf49b9cc43f28f09d8101f2

Then i generate the sha256 of the request string

    in this case: 4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d

Then I replace the hash_key with the sha256 hash

    /contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d

You may add additional parameters to this request

    /contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d&test=1234

Finally I make my request as:

	https://myapp.example.com/contacts?sort_by=last_name&search_param=Smith&hash_id=55&hash_key=4163432caae284d887911c733cc69c548d74073d505da779911051e168b4de2d&test=1234


Note that your hash_key is never sent to the server.  This model creates a very basic method for generating a hash key, it is recommeded that you override the gen_hash_key method.


Prerequisites
-------------
 * devise ~> 2.0.0 (which requires rails ~> 3.1)

Usage
-----
In the Gemfile for your application:

    gem "devise_hash_token_authenticatable"

To get the latest version, pull directly from github instead of the gem:

    gem "devise_hash_token_authenticatable", :git => "git://github.com/domain7/devise_hash_token_authenticatable.git"


Setup
-----
Run the rails generators for devise (please check the [devise](http://github.com/plataformatec/devise) documents for further instructions)

    rails generate devise:install
    rails generate devise MODEL_NAME

Run the rails generator for `devise_hash_token_authenticatable`

    rails generate devise_hash_token_authenticatable:install [options]

This will update the devise.rb initializer, and update your user model. There are some options you can pass to it:

Options:

    [--user-model=USER_MODEL]  # Model to update
                               # Default: user
    [--update-model]           # Update model to change from database_authenticatable to hash_token_authenticatable
                               # Default: true
    [--add-rescue]             # Update Application Controller with rescue_from for DeviseHashTokenAuthenticatable::HashTokenException
                               # Default: true

Configuration
-------------
In initializer  `config/initializers/devise.rb` :

* `hashtoken_id` _(default: hash_id)_
  * name of the parameter that contains user id

* `hashtoken_key` _(default: hash_key)_
  * name of the parameter that contains hash key



Troubleshooting
--------------

Development guide
------------

To start hacking on `devise_hash_token_authentication`, clone the github repository, and run the rake test task:

    git clone https://github.com/domain7/devise_hash_token_authenticatable.git
    cd devise_hash_token_authenticatable
    bundle install
    bundle exec rake spec

References
----------
* [Devise](http://github.com/plataformatec/devise)
* [Warden](http://github.com/hassox/warden)

Released under the MIT license

Copyright (c) 2012 [Domain7](http://www.domain7.com)
