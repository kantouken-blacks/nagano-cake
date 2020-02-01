class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@genres = Genre.all

    if params[:genre_id]

      @genre = Genre.find(params[:genre_id])

      @items = @genre.items.order(created_at: :desc).all
    else
      @items = Item.where(sale_status: "販売可").order(genre_id: "asc")
    # 販売ステータスが販売可のみの商品を参照　ジャンル作成の昇順
    end
  	# @items = Item.all.order(genre_id: "asc")
  end

  def show
    @cart_item = CartItem.new
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  end

end
