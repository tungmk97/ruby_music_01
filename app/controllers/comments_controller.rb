class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

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

  def destroy
    if @comment.destroy
      flash[:success] = t ".destroy"
    else
      flash[:danger] = t ".cant_destroy"
    end
    redirect_to songs_url
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
