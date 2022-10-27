class MainController < ApplicationController

  skip_before_action :validate, only: [:login, :login_post]

  def login
    @error = flash[:notice]
  end

  def login_post
    puts "helloooooo"
    @username = params[:username]
    
    @user = User.find_by(login: @username)

    puts @user;
    if  !@user || !@user.authenticate(params[:password])
      flash[:notice] = "username does not exist or password does not match"
      redirect_to main_login_path
      return
    end
    
    session[:user_id] = @user.id
    session[:logged_in] = true
    redirect_to "/main/user_items"
  end

  def user_items
    @items = Item.where(user_id:session[:user_id])
  end

  def inventories
  end
end
