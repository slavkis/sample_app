class CommentsController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy]
  before_action :find_micropost

  def create
    @comment = @micropost.comments.create(comment_params.merge({user_id: current_user.id}))
    redirect_back fallback_location: root_path
  end

  def destroy
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: root_path
  end

  private 

    def comment_params
      params.require(:comment).permit(:content)
    end

end
