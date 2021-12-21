Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords,], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }



  namespace :admin do
    resources :themes, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :show]
  end

  scope module: :user do
    resources :users, only: [:show, :edit, :update]
  end

  namespace :user do
    resources :themes, only:[:index, :show] do
      resources :answers, only:[:show, :index, :create, :edit, :update, :destroy]do
        resource :likes, only:[:create, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/admin' => 'admin/homes#top'

end
