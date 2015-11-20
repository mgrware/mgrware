Rails.application.routes.draw do


  get "signup" => "users#new", :as => "sign_up"
    resources :users

  namespace :dashboard do
    resources :blogs, :only => [:index, :create, :show, :new,]
  get 'blogs/:id/destroy/' => 'blogs#destroy', :as=>'blogs/destroy'
  get 'blogs/:id/edit' => 'blogs#edit', :as => 'blogs/edit'
  put 'blogs/:id' => 'blogs#update', :as => 'blogs/update'
  # patch 'blogs/id' => 'blogs#update', :as => 'blogs/update'
  resources :profiles, :only => [:index, :create, :show, :new,]
  get 'profiles/:user_id/edit' => 'profiles#edit', :as => 'profiles/edit'
  put 'profiles/:user_id' => 'profiles#update', :as => 'profiles/update'
  end
  
  resources :sessions
  get 'sessions/:id/active' => 'sessions#edit', :as => 'sessions/active'
  resources :blogs
  resources :dashboard, :only => [:index]
  
  get 'galleries' => 'galleries#index', :as => 'galleries'

  get 'services' => 'services#index', :as=> 'services'

  get 'abouts' => 'abouts#index', :as=> 'about'
  get 'forbidden/' => 'welcomes#restrictedarea'
  root :to => 'welcomes#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purcha,
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
    
  mount Ckeditor::Engine => '/ckeditor'
end
