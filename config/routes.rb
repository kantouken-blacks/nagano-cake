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
    resources :orders, only: [:index, :show]
    get '/customer_datas/:id/orders' => 'orders#index', as: "customer_data_orders" # 会員詳細 => 注文履歴の表示データを変える用
    get '/yesterday/orders' => 'orders#index', as: "yesterday_orders" # TOP,本日製作分の注文数 => 注文履歴の表示データ用
    get '/today/orders' => 'orders#index', as: "today_orders" # TOP,本日受注した注文数 => 注文履歴の表示データ用
    patch '/orders/:id/order_status' => 'orders#order_status_update', as: "order_status" # 注文ステータスupdate
    patch '/orders/:id/item_status' => 'orders#item_status_update', as: "item_status" # 製作ステータスupdate
  end
  #customer
  root 'homes#top'
  get '/thanks' => 'homes#thanks' #サンクスページ
  get '/orders/confirm' => 'orders#confirm', as: 'orders_confirm' #購入確認画面への遷移
  get '/orders/create_order' => 'orders#create_order' #購入確定のアクション
  post '/orders/create_ship_address' => 'orders#create_ship_address' #情報入力画面での配送先登録用のアクション
  delete '/cart_items' => 'cart_items#destroy_all' #カートアイテムを全て削除
  resources :customers, only: [:show, :edit, :update]
  get '/customers/:id/withdrow' => 'customers#withdrow', as: 'withdrow_customer' #退会画面への遷移
  patch '/customers/:id/withdrow' => 'customers#switch', as: 'withdrow_switch_customer' #会員ステータスの切替
  resources :ship_addresses, except: [:new, :show]
  resources :cart_items, except: [:new, :show, :edit]
  resources :items, only: [:index, :show]
  resources :genres, only: [:index] do
  resources :items, only: [:index]
  end
  resources :orders, except: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
