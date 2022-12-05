class Public::PostsController < ApplicationController
    
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    @categories = current_user.categories
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
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.save(post_params)
        redirect_to post_path(@post.id)
    else
        render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:start_time, :finish_time, :check, :category_id, :account_name, :category_name).merge(user_id: current_user.id)
  end
  
end
