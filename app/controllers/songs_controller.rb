class SongsController < ApplicationController
  # define index action to display all songs
  def index
  end

  # define new action for returning an simple form for creating the song
  def new
    @song = Song.new
  end

  # define create action for creating songs
  def create
    @song = Song.new(song_params)
  end

  private

  # method allows us to chose which attributes should be whitelisted for mass updating.  
  def song_params
    params.require(:song).permit(:title, :artist, :album, :genre, :year)
  end

end
