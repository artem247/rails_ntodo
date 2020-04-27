Rails.application.routes.draw do
  get '/signup', to:'users#new'
  resources :users
  resources :todo_lists do
    resources :todo_items do
      member do 
        patch :complete
      end
    end
  end

root "todo_lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
