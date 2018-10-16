class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    # @genre = @song.genre
  end

  def create
    @song = Song.create(strong_song_params(:name, :artist_id, :genre_id))

    redirect_to @song
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(strong_song_params(:name, :artist_id, :genre_id))

    redirect_to @song
  end

  private

  def strong_song_params(*args)
    params.require(:song).permit(*args)
  end
end
