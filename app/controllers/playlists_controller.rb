class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def index
    @playlist = current_user.playlists.build if logged_in?
    @playlist_items = current_user.playlists.order_desc.page params[:page]
  end

  def create
    @playlist = current_user.playlists.build playlist_params

    if @playlist.save
      flash[:success] = t ".playlist_created"
      redirect_to playlists_path
    else
      @playlist_items = []
      render "playlist/index"
    end
  end

  def edit
    @playlist = Playlist.find_by id: params[:id]
  end

  def destroy
    if @playlist.destroy
      flash[:success] = t ".playlist_deleted"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = ".delete_failed"
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit :description, :name
  end

  def correct_user
    @playlist = current_user.playlists.find_by id: params[:id]
    redirect_to root_path unless @playlist
  end
end
