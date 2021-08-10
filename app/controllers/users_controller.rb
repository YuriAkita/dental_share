class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end
end
