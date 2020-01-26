class Admin::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redict_to admin_item_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.save
      redirect_to admin_item_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :image_id, :name, :description, :price, :sale_status)
  end
end
