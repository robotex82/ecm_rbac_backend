Ecm::Rbac::Backend::Engine.routes.draw do
  resources :permissions
  resources :roles
  resources :users

  resources :import_default_permissions_service, only: [:index] do
    get  :invoke, on: :collection
    post :call,   on: :collection
  end

  root to: 'home#index'
end
