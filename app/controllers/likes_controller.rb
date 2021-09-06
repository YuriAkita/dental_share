class LikesController < ApplicationController
  before_action :authenticate_user!, expect: %i[index]
  before_action :set_review, only: %i[create destroy]

  def create
    @like = Like.create(user_id: current_user.id, review_id: params[:review_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, review_id: params[:review_id])
    like.destroy
  end

  def index
    @likes = current_user.likes.page(params[:page]).per(10)
  end

  private
  def set_review
    @review = Review.find(params[:review_id])
  end
end
