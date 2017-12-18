Rails.application.routes.draw do

  match '/login'   => 'logins#login',        :as => :login,        :via => :post
  match '/logout'  => 'logins#logout',       :as => :logout,       :via => :post
  match '/support' => 'logins#support',      :as => :support,      :via => :get
  match '/privacy' => 'logins#privacy',      :as => :privacy,      :via => :get
  match '/denied'  => 'logins#denied',       :as => :denied,       :via => :get

  match '/register'       => 'logins#register_screen', :as => :register_screen, :via => :get
  match '/register'       => 'logins#register',        :as => :register,        :via => :post
  match '/autologin/:id'  => 'logins#autologin',       :as => :autologin,       :via => :get

  match '/profile'               => 'priprofiles#index',               :as => :priprofile_index,         :via => :get
  match '/profile/avatar'        => 'priprofiles#avatar',              :as => :priprofile_avatar,        :via => :get
  match '/profile/avatar'        => 'priprofiles#avatar_update',       :as => :priprofile_avatar_update, :via => :post
  match '/profile/challenge'     => 'priprofiles#challenge',           :as => :priprofile_challenge,     :via => :post
  match '/profile/pledge'        => 'priprofiles#pledge',              :as => :priprofile_pledge,        :via => :get
  match '/profile/pledge/email'  => 'priprofiles#pledge_email',        :as => :priprofile_pledge_email,  :via => :get
  match '/profile/pledge/email1' => 'priprofiles#pledge_email1',       :as => :priprofile_pledge_email1, :via => :post
  match '/profile/pledge/email2' => 'priprofiles#pledge_email2',       :as => :priprofile_pledge_email2, :via => :post
  match '/profile/pledge/email3' => 'priprofiles#pledge_email3',       :as => :priprofile_pledge_email3, :via => :post
  match '/profile/add15m'        => 'priprofiles#add_15_minutes',      :as => :priprofile_add15m,        :via => :post
  match '/profile/subtract15m'   => 'priprofiles#subtract_15_minutes', :as => :priprofile_subtract15m,   :via => :post

  match '/home'                     => 'pubprofiles#home',          :as => :pub_home,          :via => :get
  match '/public/profile/:id'       => 'pubprofiles#show',          :as => :pub_profile,       :via => :get
  match '/public/pledge/:id'        => 'pubprofiles#pledge',        :as => :pub_pledge,        :via => :get
  match '/public/pledge/:id'        => 'pubprofiles#make_pledge',   :as => :pub_make_pledge,   :via => :post
  match '/public/pledge/thanks/:id' => 'pubprofiles#pledge_thanks', :as => :pub_pledge_thanks, :via => :get
  match '/public/pledge/ahrf/:id'   => 'pubprofiles#pledge_ahrf',   :as => :pub_pledge_ahrf,   :via => :get
  match '/public/pledge/ahrh/:id'   => 'pubprofiles#pledge_ahrh',   :as => :pub_pledge_ahrh,   :via => :get

  devise_for :users

  # Admin Resources
  namespace :rmgr do
    resources :teachers, :students
  end

  match '/rmgr'                      => 'rmgr/overviews#index',        :as => :rmgr_overviews,           :via => :get
  match '/rmgr/unregistered.:format' => 'rmgr/overviews#unregistered', :as => :rmgr_unregistered,        :via => :get
  match '/rmgr/uncollected.:format'  => 'rmgr/overviews#uncollected',  :as => :rmgr_uncollected,         :via => :get
  match '/rmgr/collected.:format'    => 'rmgr/overviews#collected',    :as => :rmgr_collected,           :via => :get
  match '/rmgr/pledge/email/:id'     => 'rmgr/overviews#pledge_email', :as => :rmgr_pledge_email,        :via => :get
  match '/rmgr/student/flyer/:id'    => 'rmgr/students#send_flyer',    :as => :rmgr_students_send_flyer, :via => :get
  match '/rmgr/teacher/flyer/:id'    => 'rmgr/teachers#send_flyer',    :as => :rmgr_teacher_send_flyer,  :via => :get

  match '/teachers'          => 'teachers/overviews#index',    :as => :teachers_overviews, :via => :get
  match '/teachers/log/time' => 'teachers/overviews#log_time', :as => :teachers_log_time, :via => :post

  root 'pubprofiles#home'

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
