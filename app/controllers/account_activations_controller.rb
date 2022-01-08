class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Your profile now active, bro!"
      redirect_to user
    else
      flash[:danger] = "Ooups! Invalid activation link..."
      redirect_to root_url
    end
  end  

end
