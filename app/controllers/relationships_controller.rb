class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    if current_user.follow(@user)
      redirect_to user_path(@user.id), notice: "#{@user}さんをフォローしました。"
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    if current_user.unfollow(@user)
      redirect_to user_path(@user.id), notice: "#{@user}さんをフォローしました。"
    end
  end
end
