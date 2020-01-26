class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@genres = Genre.all
  	@items = Item.all
  end

  def show
  	@genres = Genre.all
  	# @item = Item.find(params[:id])
  end
  private
  def item_params
  	  params.require(:item)
  end
end
