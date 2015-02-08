Rails.application.routes.draw do
  root 'pages#index'

  get 'contact' => 'pages#contact', as: :contact
  resources :posts, param: :title
end
