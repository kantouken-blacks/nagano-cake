class HomesController < ApplicationController

  before_action :authenticate_customer!, except: [:top]

  def top
    @items = Item.where(sale_status: "販売可")
  end

  def thanks
  end
end
