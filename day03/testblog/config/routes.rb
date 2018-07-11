Rails.application.routes.draw do
  root 'home#welcome'
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show', as: :author
end
