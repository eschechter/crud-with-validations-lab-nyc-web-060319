class SongsController < ApplicationController
  before_action :find_song, only: [:show, :destroy, :update, :edit]

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def edit
  end

  def update
    @song.assign_attributes(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
