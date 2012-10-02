require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe 'Users' do

  def should_be_validated(path, id, hash)
    authenticated_user = User.authenticate_with_hash_token(path, id, hash)
    assert_equal authenticated_user.id, id
  end

  def should_not_be_validated(path, id, hash)
    authenticated_user = User.authenticate_with_hash_token(path, id, hash)
    assert_nil authenticated_user
  end

  describe 'With default settings and a valid user' do
    before do
      default_devise_settings!
      user = Factory.create(:user, id: 99, email: 'example.user@test.com', password: 'secret', hash_key: '3c843e650d4c14a34100e9f9b826048f86ded4fc1eff49e5c95d929bed839ea')
    end

    describe 'load a restricted page' do
      it 'should authenticate a valid user with valid hash token' do
        should_be_validated('/posts?hash_id=99&hash_key=', 99, 'a736799c52e81ea7d9cd9314b944fea7a38046d0f461fdc74ca9d5af8a4b2b58')
      end

      it 'should reject an invalid user with valid hash token' do
        should_not_be_validated('/posts?hash_id=99&hash_key=', 1, 'a736799c52e81ea7d9cd9314b944fea7a38046d0f461fdc74ca9d5af8a4b2b58')
	  end

      it 'should reject a valid user with invalid hash token' do
        should_not_be_validated('/posts?hash_id=99&hash_key=', 99, '1234567890')
	  end
    end
  end
end
