class FavoritesController < ApplicationController
    before_action :set_post, only: [:create, :destroy]
    
    def create
      @favorite = current_user.favorites.create(post_id: params[:post_id])
      favorites_count
      redirect_to posts_url
    end
    
    def destroy
      set_favorite
      set_post
      @favorite.destroy
      @favorite = nil
      favorites_count
      redirect_to posts_url
    end
    
    
    private
    
    def set_post
      @post = Post.find(params[:post_id])
    end
    
    def set_favorite
      @favorite = current_user.favorites.find_by(post_id: params[:post_id])
    end
    
    def favorites_count
      @favorites_count = Favorite.where(post_id: @post.id).count
    end
    
end