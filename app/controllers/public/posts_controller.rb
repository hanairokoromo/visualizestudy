class Public::PostsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @user = current_user
    @follow_users = @user.followings
    @posts = Post.where(user_id: @follow_users).order("created_at DESC")
  end
  
  def new
    @post = Post.new
    @categories = current_user.categories
    @user = current_user
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
        redirect_to post_path(@post.id)
    else
        render :new
    end
  end
  
  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
    unless @post.user == current_user
      redirect_to post_path(@post.id)
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
        redirect_to post_path(@post.id)
    else
        render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end
  
  def search
    if params[:keyword].present?
      @posts = Post.joins(:category).where('category_name LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:start_time, :finish_time, :check, :category_id, :account_name, :category_name, :user_id)
  end
  
end
