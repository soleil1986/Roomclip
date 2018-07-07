class RelationshipsController < ApplicationController
  # before_action :logged_in_user

 def create
   @user = User.find(params[:follow_id])
   Relationship.create(create_params)
   redirect_to @user
 end

 def destroy
   @user = Relationship.find(params[:id]).follow
   current_user.unfollowing(@user)
   redirect_to @user
 end


    private
    def create_params
        params.permit(:follow_id).merge(follower_id: current_user.id)
    end

end
