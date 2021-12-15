Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords,], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  resources :answers
  
  namespace :admin do
    resources :themes, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  end

  scope module: :user do
    resources :users, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/about' => 'homes#about'
end
