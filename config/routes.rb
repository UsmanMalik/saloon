Rails.application.routes.draw do



  # resources :campaigns
  resources :cats
  devise_for :admins
  get 'hello/index'

  root "manager/dashboard#index"
  # get 'dashboard/index'

  scope module: :manager do
    resources :sub_sub_categories
    resources :sub_categories
    resources :categories
    resources :workers
    resources :dashboard, only: [:index] do
      get :test_page

    end
    resources :appointments do
      member do
        put :approve_appointment
        put :decline_appointment
      end
    end
    resources :staffs
    resources :users   
    resources :divisions 
  end

  namespace :api do
    resources :sessions, only: [:create, :destroy]
    resources :register do
      collection { post :register_device } 
    end
    resources :divisions, only: [:index]
    resources :appointments
    namespace :smartpush_api do
      resources :locations, only: [:create]
    end
  end

  scope module: :smartpush do
    resources :campaigns
    resources :ads
    resources :fences, only: [:index, :create]

  end

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
