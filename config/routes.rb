Gorrion::Application.routes.draw do

  namespace :sigesp do
    resources :solicituds
    resources :solicitudsalmacens
  end

  devise_for :usuarios, class_name: "Administracion::Usuario"
  namespace :administracion do
    resources :usuarios do
        
        get 'permisos', to: 'usuarios#permisos_usuario'
        post 'permiso/:permiso_id/add/', to: 'usuarios#add_permiso_usuario' , as: :permiso_add
        post 'permiso/:permiso_id/del/', to: 'usuarios#del_permiso_usuario', as: :permiso_del 
        get   'password' , to: 'usuarios#password_edit'
        patch 'password' , to: 'usuarios#password_save'      
      end 
  end

  namespace :sigesp do
      get 'tiposArticulos/',to: 'tipoarticulo#tiposArticulos'
      get 'articulos/', to: 'articulos#index' , as: :articulos
  end






#  scope module :sigesp do
#      get 'suministros/',to: 'sigesp/tipoarticulo#suministros' 
#      get 'maquinaria/',to: 'tipoarticulo#maquinaria' 
#      get 'donaciones/',to: 'tipoarticulo#donaciones'
#      get 'otros/',to: 'tipoarticulo#otros' 
#  end

  namespace :admin do
     resources :usuarios
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
