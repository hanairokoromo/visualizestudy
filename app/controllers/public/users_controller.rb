class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_paramas)
    redirect_to user_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  def search
    if params[:keyword].present?
      @users = User.where('account_name LIKE ?', "%#{params[:keyword]}%").or(User.where('introduction LIKE ?', "%#{params[:keyword]}%"))
      @keyword = params[:keyword]
    else
      @users = User.all
    end
  end
  
  def favorite
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
  
  private
  
  def user_paramas
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :account_name, :introduction, :is_deleted)
  end
end
