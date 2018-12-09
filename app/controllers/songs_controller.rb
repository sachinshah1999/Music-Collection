class SongsController < ApplicationController
  # filter method to find the song before the particular controller actions
  before_action :find_song, only: [:show, :edit, :update, :destroy]
  # Users must be logged in to create and edit songs
  before_action :authenticate_user!, only: [:new, :edit]
  # filter method to find the song before the particular controller actions
  before_action :set_genres, only: [:new, :create, :edit]

  # define index action to display all songs
  def index
    if params[:genre].blank?
      @songs = Song.all.order("created_at DESC")
    else
      @genre_id = Genre.find_by(name: params[:genre]).id
      @songs = Song.where(:genre_id => @genre_id).order("created_at DESC")
    end
  end

  # define contact action to contact the sites owner
  def contact
  end

  # define request_contact method to POST our contact form
  def request_contact
    # form values
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    respond_to do |format|
    # flash alert the user if email is blank
      if email.blank?
        format.js { flash[:alert] = I18n.t('songs.request_contact.no_email') }
        #render 'contact'
        #format.html { redirect_to contact_path }
      else if name.blank?
        format.js { flash[:alert] = I18n.t('songs.request_contact.no_name') }
        #render 'contact'
        #format.html { redirect_to contact_path }
      else if message.blank?
        format.js { flash[:alert] = I18n.t('songs.request_contact.no_message') }
        #render 'contact'
        #format.html { redirect_to contact_path }
      else
        ContactMailer.contact_email(email, name, telephone, message).deliver_now
        format.html { redirect_to root_path }
        format.js { flash[:notice] = I18n.t('songs.request_contact.email_sent') }
      end
      end
      end
    end
    #redirect_to root_path
  end

  # define request_contact method to POST our contact form
  def request_contact
    respond_to do |format|
      # form values
      name = params[:name]
      email = params[:email]
      telephone = params[:telephone]
      message = params[:message]

    # flash alert the user if email is blank
      if email.blank?
        flash[:alert] = I18n.t('songs.request_contact.no_email')
        format.html { redirect_to contact_path }
      else
        ContactMailer.contact_email(email, name, telephone, message).deliver_now
        format.html { redirect_to root_path }
        flash[:notice] = I18n.t('songs.request_contact.email_sent')
        format.js
      end
    end
  end

  # define show action to display a specific song
  def show
  end

  # define new action for returning a simple form for creating a new song
  def new
    @song = current_user.songs.build
  #  @genres = Genre.all.map { |c| [c.name, c.id]  }
  end

  # define create action for creating songs
  def create
    @song = current_user.songs.build(song_params)
    @song.genre_id = params[:genre_id]

    if @song.save
      flash[:notice] = I18n.t('songs.new.success')
      redirect_to root_path
    else
      render 'new'
      flash[:alert] = I18n.t('songs.new.fail')
  end
end

  # define edit action for returning a simple form for editing a song
  def edit
   #@genres = Genre.all.map { |c| [c.name, c.id]  }
  end

  # define update action for updating a specific song
  def update
    #@song.genre_id = params[:genre_id]
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render 'edit'
    end
  end

  # define destroy action for deleting a specific song
  def destroy
    @song.destroy
    redirect_to root_path
  end

  # Method to prevent error showing songs where id does not exist
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  def record_not_found
    redirect_to root_path
  end

  private
  # Strong Parameters:
  # method allows us to chose which attributes should be whitelisted for mass updating.
  def song_params
    params.require(:song).permit(:title, :artist, :album, :year, :genre_id)
  end

  # method to find a specific song using id
  def find_song
    if params[:id].nil?
      redirect_to root_path
    else
      @song = Song.find(params[:id])
    end
  end

  def set_genres
    @genres = Genre.all.map { |c| [c.name, c.id] }
  end

end
