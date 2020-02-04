class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if  @genre.save
      redirect_to admin_genres_path
    else
      flash[:genre_created_error] = "ジャンル名を入力してください。"
      redirect_to 
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admin_genres_path
    else
      flash[:genre_updated_error] = "ジャンル名を入力してください"
      redirect_to edit_admin_genre_path(genre)
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_enabled)
  end
end

