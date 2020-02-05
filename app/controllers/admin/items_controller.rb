class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:item_created_error] = "商品情報が正常に保存されませんでした。"
      redirect_to new_admin_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      flash[:item_updated_error] = "商品情報が正常に保存されませんでした。"
      redirect_to edit_admin_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :image, :name, :description, :price, :sale_status)
  end
end

