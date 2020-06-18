Rails.application.routes.draw do
  namespace :api do
    get "public", to: "public#public"
    get "private", to: "private#private"
    get "private-scoped", to: "private#private_scoped"
  end
end
