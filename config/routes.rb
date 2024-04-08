Rails.application.routes.draw do
  resources :issues
  resources :user_stories
  resources :milestones
  resources :projects
  resources :memberships
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
