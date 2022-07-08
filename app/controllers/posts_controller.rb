class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
        if @post.save
            rederect_to post_path(@post)
        else
            render :new
        end
    end

    # def delete
        
    # end

end