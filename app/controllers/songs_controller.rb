class SongsController < ApplicationController
  # filter method to find the song before the particular controller actions
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  # define index action to display all songs
  def index
    @songs = Song.all.order("created_at DESC")
  end

  # define show action to display a specific song
  def show
  end

  # define new action for returning an simple form for creating the song
  def new
    @song = Song.new
  end

  # define create action for creating songs
  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to root_path
    else
      render 'new'
  end
end

  private

  # method allows us to chose which attributes should be whitelisted for mass updating.
  def song_params
    params.require(:song).permit(:title, :artist, :album, :genre, :year)
  end

  # method to find a specific song using id
  def find_song
    @song = Song.find(params[:id])
  end

end
