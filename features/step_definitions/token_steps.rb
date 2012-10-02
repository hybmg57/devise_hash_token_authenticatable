Given /^the following logins:$/ do |logins|
  logins.hashes.each do |user|
    User.create(id: user["id"], email: user["email"], password: user["password"], hash_key: user["hash_key"])
  end
end

When /^ I visit "(.*)"$/ do |url|
	visit url
end

Then /^I should see "(.*)"$/ do |text|
	page.should have_content(text)
end

Then /^I should be on the login page$/ do
  current_path = URI.parse(current_url).path
	current_path.should = login_path
end
