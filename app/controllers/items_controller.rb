class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@genres = Genre.all
  	@items = Item.all.order(genre_id: "asc")
  end

  def show
    @cart_item = CartItem.new
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  end

end
