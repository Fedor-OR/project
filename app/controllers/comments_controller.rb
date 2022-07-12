class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        redirect_to post_path(@post) 
        if @comment.save
    end

    def edit
        @comment = сomment.find(params[:id])
        if @comment.update(comment_params) 
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

end