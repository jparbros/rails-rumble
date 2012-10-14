RailsRumble::Application.routes.draw do
  

  devise_for :users, :controllers => { :sessions => "sessions" }

  root :to => "dashboard#show"
  resources :campaigns do
    resources :hashtags
  end
  resources :states

  resources :incident_types

end
