class ReviewCommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review_comment = @review.review_comments.build(review_comment_params)
    @review_comment.user_id = current_user.id
    respond_to do |format|
      if @review_comment.save
        format.js { render :index }
      else
        format.html { redirect_to review_path(@review), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:review_id, :user_id, :content)
  end
end
