class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        redirect_to post_path(@post) if @comment.save
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params) 
            redirect_to post_path(params[:post_id])
        else
            render :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        redirect_to post_path(@post) if @comment.destroy
    end
    
    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end