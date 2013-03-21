Campus::Application.routes.draw do

  ActiveAdmin.routes(self)

  get "static_pages/home"
  get "static_pages/welcome"
  get "static_pages/about"
  get "static_pages/privacy"
  get "static_pages/contact"

  match 'home',    :to => 'static_pages#home'
  match 'welcome', :to => 'static_pages#welcome'
  match 'about',   :to => 'static_pages#about'
  match 'privacy', :to => 'static_pages#privacy'
  match 'contact', :to => 'static_pages#contact' 

  devise_for :users

  resources :users

  resources :study_plans

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
  end

  root :to => 'static_pages#home'

  # web interface for testing email delivery in development
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

