class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      @comment.post_id = @post.id
      if @comment.save
        # 通知の作成
        @post.create_notification_comment!(current_user, @comment.id)
        redirect_to post_path(@post)
      end
    end
    
    def destroy
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.find_by(post_id: @post.id)
      @comment.destroy
      redirect_to post_path(params[:post_id])
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:comment_id, :comment, :post_id)
    end
end
