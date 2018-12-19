class FavoritesController < ApplicationController
    
    def create
        @favorite = @current_user.favorites.create(post_id: params[:post_id])
        favorites_count
        render :index
    end
    
    def destroy
        set_favorite
        @favorite = @current_user.favorites.find_by(id: params[:id]).destroy
        @favorite = nil
        favorites_count
        render :index
    end
    
    def show
        @user = User.find_by(id: params[:id])
        @favorite_posts = @user.favorite_posts
    end
    
    private
    
    def set_post
        @post = Post.find(params[:post_id])
    end
    
    def set_favorite
        @favorite = current_user.favorites.find_by(post_id: params[:post_id])
    end
    
    def favorites_count
        @favorites_count = Like.where(post_id: @post.id).count
    end
    
end