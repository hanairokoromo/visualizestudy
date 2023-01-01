class Public::RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    # 通知の作成
    @user = User.find(params[:following_id])
    @user.create_notification_follow!(current_user)
  end
  
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  
  def followings
    user = current_user
    @users = user.followings
  end
  
  def followers
    user = current_user
    @users = user.followers
  end
end
