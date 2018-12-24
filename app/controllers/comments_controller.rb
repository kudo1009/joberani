class CommentsController < ApplicationController
    before_action :set_post, only: [:create, :destroy]
    
    def  new
        @comment = Comment.new
    end
    
    def create
        @post = Post.find_by(id: params[:id])
        @comment = current_user.comments.build(comment_params)
        @comment.post_id = @post.id
        @comment.user_id = current_user.id
        if @comment.save
            render :index
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            render :index
        end
    end
    
    private
    
    def set_post
        @post = Post.find(params[:post_id])
    end
    
    def comment_params
        params.require(:comment).permit(:opinion, :post_id, :user_id)
    end
    
end