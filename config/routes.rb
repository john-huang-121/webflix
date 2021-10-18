Rails.application.routes.draw do
  root 'root#index'
  # https://medium.com/@mazik.wyry/rails-5-api-jwt-setup-in-minutes-using-devise-71670fd4ed03
  devise_for :accounts,
              controllers: {
                sessions: 'accounts/sessions',
                registrations: 'accounts/registrations'
              }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
