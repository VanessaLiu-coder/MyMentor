require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
    @user = User.new(name: "Example", password: "123", password_confirmation: "123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 9
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
