Rails.application.routes.draw do
  resources :reclamacaos
  resources :usuarios

  root 'welcome#home'

  get '/signup', to: 'usuarios#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  get '/editar_usuario', to: 'usuarios#editar_usuario'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
