require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User must have an email" do
    user = User.new
    assert_not user.valid?
    assert "can't be blank", user.errors.messages
  end

  test "User should be created" do
    user = User.create!(email: "user@example.com")
    assert true, user.valid?
  end
end
