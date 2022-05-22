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
    get "/mypage" => "users#show"
    resources "users", only: [:index, :show]
    patch "/mypage" => "users#unsubscribe"
    resources "cosplay_images", only: [:new, :create, :index, :show, :edit]do
      resources "comments", only: [:create, :destroy]
    end

  end

  #namespace :admin do
    #get       "/"      => "users#index"

  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
