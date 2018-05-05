Rails.application.routes.draw do
  root "members#index"
  resources :members, only: %w[update] do
    get :logs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
