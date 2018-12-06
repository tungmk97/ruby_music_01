class SongsController < ApplicationController
  def index
    @songs = Song.page(params[:page]).per Settings.pages.per_page
  end

  def show
    @song = Song.include_to_song.find_by id: params[:id]
    redirect_to songs_url unless @song
    @comments = @song.comments.ordered
                     .page(params[:page]).per Settings.pages.per_page
    @comment = current_user.comments.build if logged_in?
    @genres = @song.genres
  end

  private

  def song_params
    params.require(:song).permit SONG_ATTRIBUTES
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
