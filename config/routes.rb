Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

root to: 'public/homes#top'
get "/about" => "public/homes#about"

get "/items" => "public/items#index"
get "/items/:id" => "public/items#show"

namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
