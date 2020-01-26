Rails.application.routes.draw do
devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  #admin
  namespace :admin do
    root 'homes#top'
    resources :customer_datas, only: [:show, :index, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :orders, only: [:index, :show, :update]
  end
  #customer
  root 'homes#top'
  get '/thanks' => 'homes#thanks'
  resources :customers, only: [:show, :edit, :update]
  resources :withdrow, only: [:edit, :update]
  resources :ship_addresses, except: [:new, :show]
  resources :cart_items, except: [:new, :show, :edit]
  resources :items, only: [:index, :show]
  resources :orders, except: [:edit, :update, :destroy]
  resources :session, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
