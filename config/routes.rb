Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'home#index'
  end
end
