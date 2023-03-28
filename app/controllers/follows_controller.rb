class FollowsController < ApplicationController

    def create
        @user = User.find(params[:id])
        current_user.followees << @user
        redirect_back(fallback_location: user_path(@user))
    end

    def destroy
        @user = User.find(params[:id])
        current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_back(fallback_location: user_path(@user))
    end


    def followers 
        @title = "Ваши подписчики"
        @user = User.find(params[:id])
        @follows = @user.followers
        
    end

    def following
        @title = "Вы подписаны"
        @user = User.find(params[:id])
        @follows = @user.followees
        
    end


end
