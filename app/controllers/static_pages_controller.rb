class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @comment = @micropost.comments.build
    end
  end

  def about
  end  

  def contact
  end  

  
end
