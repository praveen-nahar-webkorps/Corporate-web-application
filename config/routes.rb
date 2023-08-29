Rails.application.routes.draw do

  # home index
  root "home#index"

  # get '/home/index'
  get 'home' => 'home#index'
  # get "/home", to: "home#index"

  #It is a resource cntroller 
  resources :employees do
    member do
      get :personal_details
    end

    collection do
      get 'active'
    end
  end
  
  resources :documents

  #Defining namespace and scope
  # scope :admin do
  #   resources :employees
  # end

  get 'documents/show_by_employee/:id', to: 'documents#show_by_employee#:id'
  get 'documents/edit_by_employee/:id', to: 'documents#edit_by_employee#:id'
  get 'documents/destroy_by_employee/:id', to: 'documents#destroy_by_employee#:id'

  # get 'employees/destroy/:id', to: 'employees#destroy'
  #public pages routes
  get 'about' =>'pages#about_us'  #this is another way to render on browser
  get 'contact' => 'pages#contact_us'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-and-conditions' => 'pages#terms_and_conditions', as: 'praveentc'    #it's a alias name of route

end
