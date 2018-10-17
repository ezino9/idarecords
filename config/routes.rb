Rails.application.routes.draw do
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
  get 'home/index'

  resources :contacts, :audios, :videos, :posts
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
