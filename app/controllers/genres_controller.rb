class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def index
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.create(strong_genre_params(:name))

    redirect_to @genre
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(strong_genre_params(:name))

    redirect_to @genre
  end

  private

  def strong_genre_params(*args)
    params.require(:genre).permit(*args)
  end
end
