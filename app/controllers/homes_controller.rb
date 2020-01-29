class HomesController < ApplicationController

  before_action :authenticate_user!, except: [:top]

  def top
    @items = Item.all
  end

  def thanks
  end
end

