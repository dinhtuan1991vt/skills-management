Rails.application.routes.draw do
  root 'teams#index'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :locations

  resources :skill_categories do
    resources :skills
    collection do
      get 'pure_hierachy'
    end
  end

  get 'users/:user_id/skill_categories' => 'skill_categories#user_skills', as: :user_skills
  get 'teams/:team_id/skill_categories' => 'skill_categories#team_skills', as: :team_skills
  get 'ranks/:rank_id/skill_categories' => 'skill_categories#rank_skills', as: :rank_skills

  resources :teams
  resources :roles
  resources :users do
    member do
      get 'custom_skills'
      patch 'update_custom_skills'
    end
  end
  resources :qualifications
  resources :ranks
  get 'assesses/supervisor/:supervisor_id' => 'assesses#staffs', as: :assesses_staffs
  get 'assesses/supervisor/:supervisor_id/staff/:staff_id' => 'assesses#details', as: :assesses_details
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
