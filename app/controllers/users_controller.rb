class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @this_month_blogs = @user.blogs.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
    blogs = @user.blogs.order(created_at: :desc)
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
