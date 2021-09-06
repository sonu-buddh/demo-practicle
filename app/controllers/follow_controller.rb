class FollowController < ApplicationController
    def follow
        User.follow(params[:user])
    end

    def following
        @following = Use.all
    end
    
    def follower
        @follower = Use.all
    end
end
