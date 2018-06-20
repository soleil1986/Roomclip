Rails.application.routes.draw do
  devise_for :users
  root "users#show"
end
