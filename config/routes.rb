Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# マージする前に不要な記述を削除する
  resources :clips, only: [:new, :create]
end
