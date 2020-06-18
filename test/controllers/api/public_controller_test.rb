require "test_helper"

class Api::PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get public" do
    get api_public_url
    assert_response :success
  end
end
