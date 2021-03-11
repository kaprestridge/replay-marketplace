Rails.application.routes.draw do
  devise_for :users
  resources :listings
  root "pages#index"
  get "/faq", to: 'pages#faq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
