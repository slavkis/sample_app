class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end  

  def create
    @user = User.create(params.require(:user).permit(:name, :email, :password, 
    :password_confirmation, :checkbox))
    if @user.save
      log_in @user
      flash[:success] = "Welcome to slavkis bro app, #{@user.name}, bro!"
      redirect_to @user
    else 
      render "new"
    end 
  end

  def edit

  end

  def destroy

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end 

end
