Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  namespace :dust do

    resources :blocks
    resources :contacts
    resources :pages
    resources :posts
    resources :roles
    resources :users
    resources :menus
    resources :menu_items
    resources :site_wides, :only => [:new, :create, :destroy]

    post 'sort' => 'sortable#sort', :as => :sort_items

    namespace :gallery do
      resources :albums
      resources :photos

      namespace :api do
        resources :photos, :only => [:show, :create, :update, :destroy]
      end
    end

    resources :sessions, :only        => [:new, :create, :destroy]
    resources :password_resets, :only => [:new, :create, :edit, :update ]

    get "dashboard/show" => "dashboard#show", :as => :dashboard
    match "dashboard/update" => "dashboard#update", :as => :dashboard_update

    match 'download/csv' => 'contacts#csv', :as => :download_csv
    match 'import/csv' => 'contacts#csv_import', :as => :import_csv

    get "logout" => "sessions#destroy", :as => "logout"
    get "login" => "sessions#new", :as => "login"
    get "signup" => "users#new", :as => "signup"

  end

  scope :module => 'front_end' do
    get "search" => "page#search", :as => :front_end_search #new! search
    get "gallery/:filename" => "gallery#show", :as => :front_end_gallery

    match "sitemap" => "sitemap#index", :as => :sitemap_xml
    match 'posts/*filename' => 'posts#show', :as => :front_end_post
    get "posts/all" => "posts#index", :as => :front_end_posts

    match '*filename' => 'page#show', :as => :front_end_page

    root :to => "page#show", :filename => Dust.config.root#"welcome"
  end

end
