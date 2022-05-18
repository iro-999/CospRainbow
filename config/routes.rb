Rails.application.routes.draw do


  # 顧客用
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
    get "/user/confirmation" => "customers#confirmation"
    get "/mypage" => "users#show"
    patch "/mypage" => "users#unsubscribe"
    resources "/cosplay_images", only: [:new, :index, :show, :edit]do
      resources "/comments", only: [:create, :destroy]
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
