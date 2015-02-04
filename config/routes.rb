Rails.application.routes.draw do
  root 'pages#index'

  get '/blog' => 'pages#blog'
end
