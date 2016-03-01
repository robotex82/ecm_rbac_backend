Ecm::Rbac::Backend::Engine.routes.draw do
  resources :permissions
  resources :roles
  resources :users

  root to: 'home#index'
end
