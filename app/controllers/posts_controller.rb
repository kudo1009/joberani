class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @post = Post.find_by(id: params[:id])
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(10)
    @favorite_ranking = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end
  
  def favorite_ranking
    @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @favorite = current_user.favorites.find_by(post_id: @post.id) if user_signed_in?
    @favorites_count = Favorite.where(post_id: @post.id).count
    @comment = Comment.new
    @comments = @post.comments
    @comment = @post.comments.build
  end
  
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  
  def create
    @post= Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
     flash[:notice] = "投稿を作成しました"
     redirect_to @post
    else
     render :new
    end
    
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    
    redirect_to posts_path
  end
  
  def correct_user
    @user = User.find(Post.find(params[:id]).user_id)
    @current_user = current_user
    redirect_to posts_path, notice: '他のユーザーの投稿は編集できません。' unless view_context.current_user?(@user, @current_user)
  end
  
  
  
  private
  
  def post_params
    params.require(:post).permit(:company, :industry, :content, :matter, :period, :episode)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
