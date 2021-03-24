Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :passwords, :registrations]

  namespace :api do
    post '/login', to: 'session#log_in'
    post '/logout', to: 'session#log_out'
    post '/account', to: 'accounts#show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
