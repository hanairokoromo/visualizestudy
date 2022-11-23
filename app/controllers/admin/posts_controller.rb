class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(paramas[:id])
  end
end
