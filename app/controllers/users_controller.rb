class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:create]
  before_action :authorize, only:[:index]

  def index
    @listings = Listing.where(:user_id => session[:id])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
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
