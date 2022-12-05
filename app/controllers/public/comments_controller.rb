class Public::CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      @comment.post_id = @post.id
      @comment.save
      redirect_to post_path(@post)
    end
    
    def destroy
      @post = Comment.find(params[:post_id])
      @comment = current_user.comments.find_by(post_id: @post.id)
      @comment.destroy
      redirect_to post_path(params[:post_id])
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:comment)
    end
end