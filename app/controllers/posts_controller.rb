class PostsController < ApplicationController
  #before_filter :authorize
  before_action :authorize, except: [:show, :index]

    # GET /images
    # GET /images.json
   def index
      @posts = Post.all
   end

    # GET /images/1
    # GET /images/1.json
   def show
     #@post = Post.find(params[:id])
   end

    # GET /images/new
   def new
      @post = Post.new
   end

    # GET /images/1/edit
   def edit
   end

    # POST /images
    # POST /images.json
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@posts)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

 # def find_post
  #  @post = Post.find(params[:id])
  #end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end