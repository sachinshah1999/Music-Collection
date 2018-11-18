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

  # define new action for returning a simple form for creating a new song
  def new
    @song = current_user.songs.build
  end

  # define create action for creating songs
  def create
    @song = current_user.songs.build(song_params)

    if @song.save
      redirect_to root_path
    else
      render 'new'
  end
end

  # define edit action for returning a simple form for editing a song
  def edit
  end

  # define update action for updating a specific song
  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render 'edit'
    end
  end

  # define destroy action for deleting a specific song
  def destory
    @song.destroy
    redirect_to root_path
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
