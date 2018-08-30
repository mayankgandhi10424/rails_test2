Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors do
    resources :books
  end
  resources :people
  resources :logins
  resources :users

  # resource :basket, only: [:show, :update, :destroy]
 
  # resolve("Basket") { route_for(:basket) }

  # get '/patients/:id', to: 'patients#show'

  # get 'profile', action: :show, controller: 'users'

  # resource :geocoder
  # resolve('Geocoder') { [:geocoder] }

  # get '/patients/:id', to: 'patients#show', as: 'patient'
  # namespace :admin do
  #   resources :articles, :comments
  # end

  # scope module: 'admin' do
  #   resources :articles, :comments
  # end
  # resources :articles, module: 'admin'

  # scope '/admin' do
  #   resources :articles, :comments
  # end
  # resources :articles, path: '/admin/articles'
  # get '/posts' => 'posts#index'

  # resources :articles do
  #   resources :comments, shallow: true
  # end

  # resources :articles, shallow: true do
  #   resources :comments
  #   resources :quotes
  #   resources :drafts
  # end

  # resources :articles do
  #   resources :comments, only: [:index, :new, :create]
  # end
  # resources :comments, only: [:show, :edit, :update, :destroy]

  # concern :commentable do
  #   resources :comments
  # end   
  # concern :image_attachable do
  #   resources :images, only: :index
  # end
  # resources :messages, concerns: :commentable 
  # resources :articles, concerns: [:commentable, :image_attachable]
  # namespace :articles do
  #   concerns :commentable
  # end

  # resources :photos do
  #   member do
  #     get 'preview'
  #     # get 'a'
  #   end
  # end
  # resources :photos do
  #   get 'preview', on: :member
  # end

  # resources :photos do
  #   collection do
  #     get 'search'
  #   end
  # end
  # resources :comments do
  #   get 'preview', on: :new
  # end
  # get 'photos(/:id)', to: :display
  # get 'photos/:id/:user_id', to: 'photos#show'
  # get 'photos/:id/with_user/:user_id', to: 'photos#show'
  # get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }
  # defaults format: :json do
  #   resources :photos
  # end

  # match 'photos', to: 'photos#show', via: [:get, :post]
  # match 'photos', to: 'photos#show', via: :all

  # get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }
  # #get '/:id', to: 'articles#show', constraints: { id: /^\d/ }
  # get 'photos', to: 'photos#index', constraints: { subdomain: 'admin' }
  # get 'photos/*other/t', to: 'photos#unknownt'
  # get 'photos/*other', to: 'photos#unknown'
  # get '*a/foo/*b', to: 'photos#index'
  # get '*pages', to: 'photos#show', format: false
  # get '/stories', to: redirect('/articles')
  # get '/stories/:name', to: redirect('/articles/%{name}')
  # get '/stories/:name', to: redirect { |path_params, req| "/articles/#{path_params[:name].pluralize}" }
  # get '/stories', to: redirect { |path_params, req| "/articles/#{req.subdomain}" }

  # namespace :m do
  #   root to: "admin#index"
  # end
  direct :homepage do
    "http://www.rubyonrails.org"
  end
  direct :main do
    { controller: 'logins', action: 'new', subdomain: 'www' }
  end

  # resource :basket
  
  # resolve("Basket") { [:basket] }

  # resources :photos, path_names: { new: 'make', edit: 'change' }
  # resources :photos, as: 'images'
  # resources :user_permissions, controller: 'admin/user_permissions'

  # scope 'admin' do
  #   resources :photos, as: 'admin_photos'
  # end
   
  # resources :photos

  # scope 'admin', as: 'admin' do
  #   resources :photos, :accounts
  # end
   
  # resources :photos, :accounts

  # ActiveSupport::Inflector.inflections do |inflect|
  #   inflect.irregular 'tooth', 'teeth'
  # end

  # resources :people#, param: :identifier

end
