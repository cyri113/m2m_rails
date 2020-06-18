# frozen_string_literal: true
require "net/http"
require "uri"

class JsonWebToken
  def self.verify(token)
    JWT.decode(token,
               nil,
               true,
               algorithm: "RS256",
               iss: Rails.application.secrets.auth0_domain,
               verify_iss: true,
               aud: Rails.application.secrets.auth0_api_audience,
               verify_aud: true) do |header|
      jwks_hash[header["kid"]]
    end
  end
end
