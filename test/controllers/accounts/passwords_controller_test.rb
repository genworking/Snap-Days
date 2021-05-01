require 'test_helper'

module Accounts
  class PasswordsControllerTest < ActionDispatch::IntegrationTest
    test "should get edit" do
      get accounts_passwords_edit_url
      assert_response :success
    end

    test "should get update" do
      get accounts_passwords_update_url
      assert_response :success
    end
  end
end
