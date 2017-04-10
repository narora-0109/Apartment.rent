class UsersController < ApplicationController
  def index

  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      #session[:name] = @user.name
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private

   def allowed_params
    params.require(:user).permit(:name, :phoneNum, :password, :password_confirmation)
   end

end
