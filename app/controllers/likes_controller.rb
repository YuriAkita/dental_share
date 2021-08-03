class LikesController < ApplicationController
  def create
    like = current_user.likes.create(review_id: params[:review_id])
    redirect_to reviews_path, notice: "#{like.review.user.name}さんのカウンセリング口コミ投稿をいいねしました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to reviews_path, notice: "#{like.review.user.name}さんのカウンセリング口コミ投稿をいいね解除しました"
  end

  def index
    @likes = current_user.likes
  end
end
