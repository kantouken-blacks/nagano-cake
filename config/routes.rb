Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'items/index'
  get 'items/show'
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'ship_addresses/index'
  get 'ship_addresses/create'
  get 'ship_addresses/edit'
  get 'ship_addresses/update'
  get 'ship_addresses/destroy'
  get 'withdrow/edit'
  get 'withdrow/update'
  get 'customers/edit'
  get 'customers/update'
  get 'homes/top'
  get 'homes/thanks'
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admins do
    get 'customer_datas/index'
    get 'customer_datas/edit'
    get 'customer_datas/update'
  end
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
