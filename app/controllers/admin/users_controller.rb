class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  def new
    @user = User.new
  end

  private

  def if_not_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:notice] = '管理者以外はアクセスできません'
    end
  end
end
