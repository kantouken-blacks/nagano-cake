class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@genres = Genre.all
    @items = Item.where(sale_status: "販売可").order(genre_id: "asc")
    # 販売ステータスが販売可のみの商品を参照　ジャンル作成の昇順

  	# @items = Item.all.order(genre_id: "asc")
  end

  def show
    @cart_item = CartItem.new
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  end

end
