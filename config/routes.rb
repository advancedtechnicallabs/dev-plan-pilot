Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    log_out: 'users/sign_out'
  }
  resources :issues

  resources :user_stories do
    member do
      put :sort
    end
  end


  resources :milestones do
    member do
      put :sort
    end
  end

  resources :projects
  resources :memberships
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/gannt", to: "gannt#index"

  scope '/api' do
    get "/data", :to => "gannt#data"
  end

# Defines the root path route ("/")
  root "home#index"
end
