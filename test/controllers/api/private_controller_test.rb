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

  private

  def access_token
    url = URI("https://#{Rails.application.credentials.auth0[:api][:domain]}/oauth/token")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = "application/json"
    request.set_form_data({
      client_id: Rails.application.credentials.auth0[:api][:client][:id],
      client_secret: Rails.application.credentials.auth0[:api][:client][:secret],
      audience: Rails.application.credentials.auth0[:api][:audience],
      grant_type: "client_credentials",
    })

    response = http.request(request)
    access_token = JSON.parse(response.read_body)["access_token"]
    # puts access_token
    access_token
  end
end
