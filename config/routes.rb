Rails.application.routes.draw do
devise_for :admin,skip: [:passwords, :registrations], controllers: {
  sessions:      'admin/sessions'
}

get 'customers/edit' => 'public/customers#edit', as: 'public_edit_customer'
patch '/customers' => 'public/customers#update', as: 'public_update_customer'

devise_for :customers,skip: [:passwords], controllers: {
  sessions:      'public/sessions',
  registrations: 'public/registrations'
}

namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
  end

scope module: :public do
  root to: 'homes#top'
  get "/about" => "homes#about"
  resources :items, only:[:index, :show]
  get "/customers/my_page" => "customers#show"
  # patch "/customers" => "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe"
  patch "/customers/withdraw" => "customers#withdraw"
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
