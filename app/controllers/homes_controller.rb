class HomesController < ApplicationController

  before_action :authenticate_user!, except: [:top]

  def top
  end

  def thanks
  end
end

