RailsStore::Application.routes.draw do
resources :reviews, :only => [:new, :create] 
resources :products #you can tell your resources to only use a certain set of routes
root :to => 'products#index'

get '/reviews', :controller => 'reviews', :action => 'new', :as => 'new_review'
post '/reviews(.:format)', :controller => 'reviews', :action => 'create', :as => 'review'
get '/reviews/:id(.:format)', :controller => 'reviews', :action => 'show', :as => 'review'
get '/reviews/:id/new', :controller => 'reviews', :action => 'new', :as => 'new_review'
get '/reviews/:id/edit(.:format)', :to => 'products#edit'

get 'product/cart(.:format)', :to => 'products#carted_products'
get '/yourcart', :to => 'products#carted_products'

end





#         root        /                            products#index
#     products GET    /products(.:format)          products#index
#              POST   /products(.:format)          products#create
#  new_product GET    /products/new(.:format)      products#new
# edit_product GET    /products/:id/edit(.:format) products#edit
#      product GET    /products/:id(.:format)      products#show
#              PUT    /products/:id(.:format)      products#update
#              DELETE /products/:id(.:format)      products#destroy
#              GET    /product/cart(.:format)      products#carted_products
#     yourcart GET    /yourcart(.:format)          products#carted_products



#       review GET    /reviews/:id(.:format)       reviews#show
#   new_review GET    /reviews/:id/new(.:format)   reviews#new
#   new_review GET    /reviews/new(/.:format)      reviews#new
#              POST   /reviews(.:format)           reviews#create
#              GET    /reviews/:id/edit(.:format)  products#edit
#      reviews GET    /reviews(.:format)           reviews#index







  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
