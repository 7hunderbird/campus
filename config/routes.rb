Campus::Application.routes.draw do

  ActiveAdmin.routes(self)

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/privacy"
  get "static_pages/contact"

  match 'home',    :to => 'static_pages#home'
  match 'about',   :to => 'static_pages#about'
  match 'privacy', :to => 'static_pages#privacy'
  match 'contact', :to => 'static_pages#contact' 

  match 'welcome', :to => 'users#welcome', as: :welcome

  match 'wall', :to => 'users#wall', as: :wall

  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :homeworks do
    put 'complete', :on => :member
  end
  
  resources :study_plans
  resources :relationships, only: [:create, :destroy]
  # resources :wall

  resources :courses do
    resources :materials
    resources :sections
    resources :assignments
  end
  
  resources :enrollments do
    post 'course', :on => :member
  end
  
  resources :tasks

  resources :topics
  
  resources :outlines do
    collection { post :order}
  end

  resources :users do
    resources :study_plans
    # resources :wall
  end

  root :to => 'static_pages#home'

  # web interface for testing email delivery in development
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

