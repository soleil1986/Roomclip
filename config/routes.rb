Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# マージする前に不要な記述を削除する
  root "clips#index"
  resources :clips, only:[:index, :new, :create, :destroy, :show]
  resources :users, only: [:show]
  post '/clips/:clip_id/like' => 'likes#create', as: 'clip_like'
  delete 'clips/:clip_id/unlike' => 'likes#destroy', as: 'clip_unlike'
end
