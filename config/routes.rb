Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  root app/views/header.html.erb
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
=======

# マージする前に不要な記述を削除する
  resources :clips, only: [:new, :create]
>>>>>>> 2861ec608f42db944a1e76335eecf175c0c2264f
end
