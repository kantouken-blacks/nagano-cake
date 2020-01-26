class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@genres = Genre.all
  end

  def show
  end
end
