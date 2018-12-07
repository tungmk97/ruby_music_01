class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @song = Song.find_by id: params[:song_id]
    @comment = @song.comments.build comment_params

    if @comment.save
      respond_to do |format|
        format.html{redirect_to @song}
        format.js{flash.now[:notice] = t ".created"}
      end
    else
      respond_to do |format|
        format.html{redirect_to @song}
        format.js{flash.now[:notice] = t ".failed"}
      end
    end
  end

  def destroy
    @song = Song.find_by id: @comment.song.id

    if @comment.destroy
      respond_to do |format|
        format.html{redirect_to @song}
        format.js{flash.now[:notice] = t ".destroy"}
      end
    else
      respond_to do |format|
        format.html{redirect_to request.referrer || root_url}
        format.js{flash.now[:notice] = t ".cant_destroy"}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge user: current_user
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to songs_url unless @comment
  end
end
