class HomesController < ApplicationController

  before_action :authenticate_customer!, except: [:top]

  def top
    @items = Item.all
  end

  def thanks
  end
end
