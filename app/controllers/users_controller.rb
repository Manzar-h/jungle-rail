class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      puts "this is the user_id", session[:user_id]
      redirect_to root_path
    else
      #puts "save failed", user.errors.inspect
      redirect_to signup_path
      
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end