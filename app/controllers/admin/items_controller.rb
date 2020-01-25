class Admin::ItemsController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :image_id, :name, :description, :price, :sale_status)
  end
end
