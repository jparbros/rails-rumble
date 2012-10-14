RailsRumble::Application.routes.draw do



  devise_for :users, :controllers => { :sessions => "sessions" }

  root :to => "dashboard#show"
  resources :campaigns do
    resources :hashtags
    resources :incidents do
      resources :comments, controller: "incidents/comments"
    end
  end

  resources :states
  resources :incident_types
end
