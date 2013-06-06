AngularGithub::Application.routes.draw do
  resources :repositories, only: :index
  
  root 'repositories#index'
end
