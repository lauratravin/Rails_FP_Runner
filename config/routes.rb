Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


#root
root 'application#nyrr'

#routes for User
resources :users, :only =>  [:index, :new, :create, :edit, :update, :show]

resources :users, only: [:show] do
   resources :registrations, only: [:index, :show, :create, :destroy, :edit, :update ] 
end  
resources :registrations

resources :users, only: [:show] do
  resources :races, only: [:show]
end

resources :users do
 resources :goals, only: [:new]
end 

resources :goals

get '/admin' => "admin#index" 

#routes for sessions
get '/login' => "sessions#new"
post '/sessions' => "sessions#create"
get '/logout' => "sessions#destroy"

# get '/auth/facebook/callback' => 'sessions#create'

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

#routes for races
resources :races, :only =>  [:index, :new, :create, :edit, :update, :show]
post '/status' => "races#updatestatus"


end
