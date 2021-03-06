Pinteresting::Application.routes.draw do
  resources :pins do
    collection do
      get 'select_mode'
      get 'select_picture'
      get 'new_pin_web'
    end
  end

  devise_for :users
  post 'customusers' => 'users#create'
  resources :user_sessions, only: [:create]
  root "pins#index"
  get "about" => "pages#about"

  resources :charges, only: [:create]
  resources :purchases, only: [:show]
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]

  # new pages
  get "north_america" => "pages#north_america"
  get "europe" => "pages#europe"
  get "africa" => "pages#africa"
  get "asia" => "pages#asia"
  get "australia" => "pages#australia"
  get "south_america" => "pages#south_america"
  get 'video_purchasing' => 'pages#video_purchasing'

 # to display the pins upon user's signing in
  get "login" => "pages#user_profile"
  get "my_pins" => "pages#my_pins"

 # to display the terms of service and private policy
 get "america" => "pages#america"

 get "selection" => "pins#selection"

 get 'blog' => 'posts#index'

  get "termsofservice" => "pages#terms_of_service"
  get "privacypolicy" => "pages#privacy_policy"

 resources :posts do
    resources  :comments
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
