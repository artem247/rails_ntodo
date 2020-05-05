Rails.application.routes.draw do
  get '/signup', to:'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users 
    resources :todo_lists do
      resources :todo_items do
        member do 
          patch :complete
          get :edit_deadline
          patch :update_deadline
          patch :move
        end
      end
    end
  

root "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
