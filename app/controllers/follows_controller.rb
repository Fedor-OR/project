class FollowsController < ApplicationController

    
    def followers 
        @title = "Ваши подписчики"
        @user = User.find(params[:id])
        @follows = @user.followers
        
        # @user = User.followed_users.find_by(followee_id: @user.id)
    end

    def following
        @title = "Вы подписаны"
        @user = User.find(params[:id])
        @follows = @user.followees
        
        # @user = User.followed_users.find_by(followee_id: @user.id)
    end


end
