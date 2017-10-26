Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' , omniauth_callbacks: 'callbacks' }

  # root to: 'users#index', via: :get
  # get 'auth/facebook', as: "auth_provider"
  # get 'auth/facebook/callback', to: 'users#login'

  # devise_for :admins ,path: "backend", class_name: "User"
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Api
  namespace :api do
    namespace :v1 do
      controller :categories do
        get :get_categories
        end

      controller :news do
        get :get_news_pages
        get :get_news_categories_pages
        post :post_create_news
        post :post_update_news
      end
    end
  end

  # authenticated :admin do
  #   root 'backend#dashboard#index', as: :authenticated_admin
  # end
  # Backend
  namespace :backend, path: 'dashboard' do

    root to: 'dashboard#index'

    resources :categories do
      # put :update_status
      post :update_status, :to => 'categories#update_status'

    end
    resources :news do
      post :update_status, :to => 'news#update_status'
    end
    resources :comments , :only => [:index, :show , :destroy] do
      post :update_status, :to => 'comments#update_status'
    end

    get '/elfinder_manager', to: 'elfinder#index'
    match 'elfinder' => 'elfinder#elfinder', via: [:get, :post]


    resources :users
  end

  # get '/elfinder_manager', to: 'elfinder#index'
  # match 'elfinder' => 'elfinder#elfinder', via: [:get, :post]


  #frontend
  namespace :frontend, path: '/' do
    root to: 'homes#index', as: 'root' , via: :get
    # get '/page/:page' , to: 'homes#index' , as: ""
    get '/categories/:id', to: 'categories#show' , as: "show_category"
    get '/post-new', to: 'post_news#index' , as: "index_post_news"
    get '/most-views', to: 'most_views#index' , as: "most_views_news"
    get '/news/:id', to: 'news#show' , as: "show_news"
    post '/news/:id', to: 'news#create' , as: "show_comment"
    get '/search', to: 'search#index' , as: "search_news"

    # get 'auth/facebook', as: "auth_provider"
    # get 'auth/facebook/callback', to: 'users#login'
    # get :update_show, to: 'news#show' , as: "show_news"
    # controller :categories do
    #
    # end
    # devise_for :users
    # devise_for :users, class_name: "Frontend::User"
    # concern :paginatable do
    #   get '(page/:page)', to: 'homes#index', on: :collection, as: ''
    # end
    #
    #   get '/', concerns: :paginatable
  end

end
