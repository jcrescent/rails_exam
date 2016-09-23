class UsersController < ApplicationController
  def login
  	render 'login'
  end

  def index
  	@current_user = User.find(session[:id])
  	@users = User.all
  	render 'index'
  end

  def create
    user = User.new(user_params)
    if user.save 
        session[:id] = user.id
        redirect_to '/profile'
    else 
       flash[:notice] = user.errors.full_messages   
       redirect_to  '/' 
     end
  end

  def validate
  	user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:id] = user.id
        redirect_to "/profile"
      else  
        flash[:alert] = ["Invalid Email or Password"]
        redirect_to '/'
      end
    else 
      flash[:alert] = ["Email doesn't exist"]   
      redirect_to '/'  
    end
  end

  def profile
  	@user = User.find(session[:id])
  	@connections = @user.other_users
  	@pending = User.all
  	render 'profile'
  end

  def show
  	@user = User.find(params[:id])
  	render 'show'
  end

  def logout
  	session.clear
  	redirect_to '/'
  end
   private 
  def user_params
    params.require(:new_user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end

