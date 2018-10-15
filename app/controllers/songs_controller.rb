class SongsController < ApplicationController

  def index
    @songs = Song.all
    # @artists = Artist.all
    # @genres = Genre.all
  end

  def show
    # byebug
		@song = Song.find(params[:id])
		@genre = Genre.find(@song.genre_id)
		@artist = Artist.find(@song.artist_id)


	end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to song_path(@song)

  end

  def new
    @song = Song.new

  end

  def edit
    @song = Song.find(params[:id])

  end

  def create
    # byebug
    @song = Song.create(song_params)

    redirect_to song_path(@song)
  end

end

private

def song_params
  params.require(:song).permit(:name, :artist_id, :genre_id)

end
