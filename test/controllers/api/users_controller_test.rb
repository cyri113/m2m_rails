require "test_helper"

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get users_by_email (unauthorized)" do
    get api_users_by_email_url
    assert_response :unauthorized
  end

  test "should get users_by_email" do
    get api_users_by_email_url, headers: { "authorization": "Bearer #{access_token}" }
    assert_response :success
  end
end
