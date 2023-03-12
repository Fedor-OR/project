class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = current_user.posts.new
    end
    def create
        @post = Post.new(post_params) #костыли
        @post.author = current_user.name
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params) 
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.destroy(params[:id])
        redirect_to posts_path
    end


    private

     def post_params
        params.require(:post).permit(:title, :body, :comments, :photo)
     end    

end