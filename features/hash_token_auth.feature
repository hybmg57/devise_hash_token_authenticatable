Feature: Hash Token Auth
  In order to access pages with Devise Hash Token Authenticatable
  As a user
  I want to access restricted pages with Hash Tokens

  Background:
    Given the following logins:
      | id | email                 | password | hash_key                                                        |
      | 99 | example.user@test.com | secret   | 3c843e650d4c14a34100e9f9b826048f86ded4fc1eff49e5c95d929bed839ea |

  Scenario: Access posts page with a valid hash key
    When I visit "/posts?hash_id=99&hash_key=a736799c52e81ea7d9cd9314b944fea7a38046d0f461fdc74ca9d5af8a4b2b58"
    Then I should see "posts#index"

  Scenario: Get redirected to login page with an invalid hash key
    When I visit "/posts?hash_id=99&hash_key=a736799c52e81ea7d9cd9314b944fea7a38046d0f461fdc74ca9d5af8a4b2b58"
    Then I should be on the login page

  Scenario: Get redirected to login page with an invalid hash id
    When I visit "/posts?hash_id=1&hash_key=a736799c52e81ea7d9cd9314b944fea7a38046d0f461fdc74ca9d5af8a4b2b58"
    Then I should be on the login page
