Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# マージする前に不要な記述を削除する
  root "clips#index"

  resources :users, only: [:show] do
      member do
       get :follow,:follower,:photo_list,:mytag
      end
  end
  resources :clips, only:[:index, :new, :create, :destroy, :show] do
    namespace :lists do
      resources :tags, param: :name, only: [:index, :show]
    end
  end

  resources :relationships, only: [:create, :destroy]

  post '/clips/:clip_id/like' => 'likes#create', as: 'clip_like'
  delete 'clips/:clip_id/unlike' => 'likes#destroy', as: 'clip_unlike'

end

