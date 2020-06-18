class Api::UsersController < ApplicationController
  include Secured

  def users_by_email
    @users = User.where(email: params[:email])
    render json: @users, status: :ok
  end
end
