class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash[:warning] = "Sorry, bro ( Account not activated. Check ur email, bro, please, bro.."
        redirect_to root_url
      end
    else  
      flash.now[:danger] = "Ooups... Be careful, bro! Something went wrong"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end  

end
