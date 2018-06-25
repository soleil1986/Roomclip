Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# マージする前に不要な記述を削除する
  root to: "clips#index"
  resources :clips, only:[:index, :new, :create, :destroy, :edit, :update] do
]
end
