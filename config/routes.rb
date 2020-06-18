Rails.application.routes.draw do
  namespace :api do
    get "public", to: "public#public"
  end
end
