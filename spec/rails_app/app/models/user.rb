class User < ActiveRecord::Base
  devise :database_authenticatable, :hash_token_authenticatable, :registerable, :recoverable, :rememberable, :trackable
  attr_accessible :email, :password, :password_confirmation
end
