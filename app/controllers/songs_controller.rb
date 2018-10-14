class SongsController < ApplicationController
  def create
    @song=Song.new(song_params(:name,:artist_id,:genre_id))
    @song.save
    redirect_to @song
  end

  def update
    @song=Song.find(params[:id])
    @song.update(song_params(:name,:artist_id,:genre_id))
    redirect_to @song
  end

  def new
    @song=Song.new
    @artists=Artist.all
    @genres=Genre.all
  end

  def index
    @songs=Song.all
  end

  def show
    @song=Song.find(params[:id])
    @genre=@song.genre_id
    @artist=@song.artist_id
  end

  def edit
    @song=Song.find(params[:id])
    @artist=Artist.all
    @genres=Genre.all
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
