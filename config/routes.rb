Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# マージする前に不要な記述を削除する
  root "clips#index"
  resources :users, only: [:show]
  resources :clips, only:[:index, :new, :create, :destroy, :show] do
    namespace :lists do
      resources :tags, param: :tag_id, only: [:index, :show]
    end
  end
end

