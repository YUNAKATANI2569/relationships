class RelationshipsController < ApplicationController
  before_action :authenticate_user!
	def create
		current_user.follow(params[:user_id])
		redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:user_id])
		redirect_to request.referer
	end
  def followings
		user = User.find(params[:user_id])
		@users = user.followings
  end

  def followers
		user = User.find(params[:user_id])
		@users = user.followers
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
