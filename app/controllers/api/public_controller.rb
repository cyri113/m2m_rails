class Api::PublicController < ApplicationController
  def public
    render json: { message: "Hello from a public endpoint! You don't need to be authenticated to see this." }
  end
end
