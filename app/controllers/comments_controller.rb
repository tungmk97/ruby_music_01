class CommentsController < ApplicationController
  def create
    @song = Song.find_by id: params[:song_id]
    @comment = @song.comments.build comment_params

    if @comment.save
      flash[:success] = t ".created"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to songs_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge user: current_user
  end
end
