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
    @checkEmail = User.where(:email => allowed_params[:email])
    @checkUser = User.where(:name => allowed_params[:name])
    if !@checkEmail.empty? || !@checkUser.empty?
      redirect_to root_url, :notice => "user with email address or user name already exists"
    else
      @user = User.new(allowed_params)
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        #@user.error.messages.push("Please verify your email address to continue")
        redirect_to root_url, :notice => "Please verify your email address to continue"
      else
        render 'new'
      end
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      #@user.error.messages.push("Welcome to the ApartmentFinder! Your email has been confirmed. Please sign in to continue.")
      redirect_to root_url, :notice => "Welcome to the ApartmentFinder! Your email has been confirmed. Please sign in to continue."
    else
      #@user.error.messages.push("Sorry. User does not exist")
      redirect_to root_url, :notice => "Sorry, user does not exist."
    end
  end

  private

   def allowed_params
    params.require(:user).permit(:name, :phoneNum, :password, :password_confirmation, :email,:confirm_email, :confirmation_token)
   end


end
