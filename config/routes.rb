Rails.application.routes.draw do
  root 'root#index'
  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions', only: [:create]  
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
