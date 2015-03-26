Rails.application.routes.draw do


  # root, :to redirect('/postcards')
  resources :postcards, only: [:index, :create]

end
