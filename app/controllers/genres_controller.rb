class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    art_arr = []
    @genre = Genre.find(params[:id])
    @genre.artists.each do |artist|
      art_arr << artist
    end
    @art_arr = art_arr.uniq
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genre_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
