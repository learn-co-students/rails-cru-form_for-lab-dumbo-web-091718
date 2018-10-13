require 'pry'

class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @artists = Artist.all
    @genres = Genre.all
  end

  def create
    @song = Song.new(song_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to @song
  end

  def show
    @song = Song.find(params[:id])
    @genre = @song.genre_id
    @artist = @song.artist_id
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:name, :artist_id, :genre_id))
    redirect_to @song
  end

  def edit
    @song = Song.find(params[:id])
    @artists = Artist.all
    @genres = Genre.all
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
