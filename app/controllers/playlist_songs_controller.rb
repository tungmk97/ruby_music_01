class PlaylistSongsController < ApplicationController
  def create
    @playlist = Playlist.find_by name: params[:playlist_id],
      user_id: params[:user_id]
    @song = Song.find_by id: params[:song_id]
    @playlist_song = PlaylistSong.new playlist_id: @playlist.id,
      song_id: @song.id

    if @playlist_song.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @song
  end
end
