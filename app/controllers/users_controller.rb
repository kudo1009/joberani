class UsersController < ApplicationController
  
  def show
    if params[:format].present?
      @user = User.find(params[:format])
    else
      @user = User.find(params[:id])
    end
    @posts = @user.posts
    @favorite_posts = Post.find(Favorite.find(@user.favorites.ids).pluck(:post_id))
  end
  
end
