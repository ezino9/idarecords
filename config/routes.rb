Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  get 'about/index'
  mount Ckeditor::Engine => '/ckeditor'
  get 'types/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'comments/new'
  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/index'
  get 'categories/show'
  get 'categories/destroy'
  devise_for :users
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/index'
  get 'posts/show'
  get 'posts/destroy'
  get 'videos/new'
  get 'videos/create'
  get 'videos/edit'
  get 'videos/update'
  get 'videos/index'
  get 'videos/show'
  get 'videos/destroy'
  get 'audios/new'
  get 'audios/create'
  get 'audios/edit'
  get 'audios/update'
  get 'audios/index'
  get 'audios/show'
  get 'audios/destroy'
  get 'contact' => 'contacts#new', :as => 'contact'
  get 'contacts/create'
  get 'about' => 'about#index', :as => 'about'
  get 'home' => 'home#index', as: 'home'

  resources :contacts, :audios, :videos, :posts, :categories, :comments, :services
  resources :types, only: [:show]

  resources :posts do
    resources :comments
  end
  root 'home#index'
  
  match "*path", to: "videos#catch_404", via: :all
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
