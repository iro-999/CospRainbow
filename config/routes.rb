Rails.application.routes.draw do


  # ユーザー用
    devise_for :users,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

  # 管理者用
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }

  namespace :public, path: '/' do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/user/confirmation" => "users#confirmation"
    resources "users", only: [:index, :show, :edit, :update, :confirmation]
    resources "cosplay_images" do
      resources "comments", only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "search" => "searches#search"
    patch "/user/unsubscribe" => "users#unsubscribe"

  end

  #namespace :admin do
    #get       "/"      => "users#index"

  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
