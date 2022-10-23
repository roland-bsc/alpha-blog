Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home' #this goes to a controller
  get 'about', to: 'pages#about' #another controller action called 'about'
  resources :articles, only: [:show, :index, :new, :create]

end
