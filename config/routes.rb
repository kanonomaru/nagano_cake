Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  devise_for :users

  namespace :admin do
    resources :genres, :items, :customers, only: [:new, :show, :index, :destroy, :edit, :update, :create]
  end

namespace :public do
  resources  :items, :customers, :addresses, :cart_items, only: [:new, :show, :index, :destroy, :edit, :update, :create, :unsubscribe]
end

  post 'admin/genres' => 'admin#create'
  post 'admin/items/new' => 'admin#create'
  root to: 'public/homes#top'
  get '/admin' => 'admin#homes'
  get "/about" => "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
