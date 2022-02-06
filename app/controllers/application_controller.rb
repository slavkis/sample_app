class ApplicationController < ActionController::Base
  include SessionsHelper

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in, bro..."
        redirect_to login_url
      end  
    end 

    def find_micropost
      @micropost = Micropost.find(params[:micropost_id]) 
    end

end
