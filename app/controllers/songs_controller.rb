class SongsController < ApplicationController
  def index
    @songs = Song.page(params[:page]).per Settings.pages.per_page
  end

  def show
    @song = Song.included.find_by id: params[:id]
    redirect_to songs_url unless @song
  end

  private

  def song_params
    params.require(:song).permit SONG_ATTRIBUTES
  end
end
