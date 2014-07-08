DbProj::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'application#index'

  get '/sign_in', to: "sessions#new", as: 'sign_in'
  post '/sessions', to: "sessions#create", as: "submit_login"
  get '/sign_out', to: "sessions#destroy", as: "sign_out"
  get '/backup', to: "employees#backup", as: "backup"
  get '/restore', to: "employees#restore", as: "restore"
  get '/reportbanks', to: "employees#banks_report", as: "banks_report"
  get '/reportcustomers', to: "employees#customers_report", as: "customers_report"
  get '/reportaccounts', to: "employees#accounts_report", as: "accounts_report"
  get '/reportbranches', to: "employees#branches_report", as: "branches_report"
  get '/reportloans', to: "employees#loans_report", as: "loans_report"

  resources :accounts, except: [:edit, :update]
  resources :banks, except: [:edit, :update]
  resources :branches, except: [:edit, :update]
  resources :customers, except: [:edit, :update]
  resources :employees, only: [:show]
  resources :loans, except: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
