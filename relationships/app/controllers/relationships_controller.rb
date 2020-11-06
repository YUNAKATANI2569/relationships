class RelationshipsController < ApplicationController
def follow
  user = User.find(params[:id])
  current_user.follow(user.id)

  redirect_to request.referer
end




def unfollow
  current_user.unfollow(params[:id])
  redirect_to request.referer
end



  def followings
     user = User.find(params[:user_id])
     @users = user.following_user
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.follower_user
  end


end



#   before_action :set_user

#   def create
#     following = current_user.follow(@user)
#     if following.save
#       flash[:success] = 'ユーザーをフォローしました'
#       redirect_to @user
#     else
#       flash.now[:alert] = 'ユーザーのフォローに失敗しました'
#       redirect_to @user
#     end
#   end


#   def destroy
#     following = current_user.unfollow(@user)
#     if following.destroy
#       flash[:success] = 'ユーザーのフォローを解除しました'
#       redirect_to @user
#     else
#       flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
#       redirect_to @user
#     end
#   end

#     private
#   def set_user
#     @user = User.find params[:follow_id]
#   end
# end
