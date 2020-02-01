class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	  @genres = Genre.all

      # もしURLに[:genre_id]が含まれていたら
    if params[:genre_id]
      # その[:genre_id]のデータをGenreから@genreに格納
      @genre = Genre.find(params[:genre_id])
      # @genreに紐付いた商品で販売可の商品を引っ張る（作成順の昇順）
      @items = @genre.items.order(created_at: :desc).where(sale_status: "販売可")

      # 含まれていなければ
    else
      @items = Item.where(sale_status: "販売可").order(genre_id: "asc")
     # 販売ステータスが販売可のみの商品を参照 ジャンル作成の昇順
    end
  end

  def show
    @cart_item = CartItem.new
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  end

end
