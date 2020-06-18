require "test_helper"
require "uri"
require "net/http"

class PrivateControllerTest < ActionDispatch::IntegrationTest
  test "should get private (unauthorized)" do
    get api_private_url
    assert_response :unauthorized
  end

  test "should get private_scoped (unauthorized)" do
    get api_private_scoped_url
    assert_response :unauthorized
  end

  test "should get private" do
    get api_private_url, headers: { "authorization": "Bearer #{access_token}" }
    assert_response :success
  end

  test "should get private_scoped" do
    get api_private_scoped_url, headers: { "authorization": "Bearer #{access_token}" }
    assert_response :success
  end
end
