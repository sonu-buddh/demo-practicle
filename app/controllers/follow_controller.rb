class FollowController < ApplicationController
    def follow
        Followship.create(follower_id: current_user.id, followee_id: params[:id])
        redirect_to root_path
    end

    def following
        @following = Followship.where(follower_id: current_user.id)
    end
    
    def follower
        @followers = Followship.where(followee_id: current_user.id)
    end
end
