class RelationshipsController < ApplicationController
  before_action :logged_in_user

 def create
   @user = User.find(params[:follower_id])
   current_user.follow(@user)
   # redirect_to
 end

 def destroy
   @user = Relationship.find(params[:follow_id]).follower
   current_user.unfollow(@user)
   # redirect_to
 end

end
