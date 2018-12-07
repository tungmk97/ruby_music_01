class Admin::SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new song_params

    if @song.save
      flash[:success] = t ".success"
      redirect_to root_url
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  private

  def song_params
    params.require(:song).permit Song::SONG_ATTRIBUTES
  end
end
