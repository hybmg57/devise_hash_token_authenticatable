FactoryGirl.define do
  sequence :user_id do |n|
    n
  end
  factory :user do
    id       { FactoryGirl.generate :user_id }
    email    "example.user@test.com"
    password "secret"
	hash_key "1234567891012345678910123456789101234567891012345678910"
  end
end
