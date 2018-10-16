class ArtistsController < ApplicationController


  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.all
  end

  def show
  @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.create(strong_artist_params(:name, :bio))
    # artistartist[name]
    # if @artist.save
    redirect_to @artist
  # else
  #   render :new
  # end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(strong_artist_params(:name, :bio))
    redirect_to @artist
  end

  private

  def strong_artist_params(*args)
    params.require(:artist).permit(*args)
  end
end
