class ReviewCommentsController < ApplicationController
  before_action :authenticate_user!, expect: %i[index]
  before_action :ensure_current_user, only: %i[ edit update destroy ]

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

  def edit
    @review = Review.find(params[:review_id])
    @review_comment = @review.review_comments.find(params[:id])
    @review_comment.user_id = current_user.id
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @review = Review.find(params[:review_id])
    @review_comment = @review.review_comments.find(params[:id])
    @review_comment.user_id = current_user.id
      respond_to do |format|
        if @review_comment.update(review_comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    @review_comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:review_id, :user_id, :content)
  end

  def ensure_current_user
    @review_comment = ReviewComment.find(params[:id])
    if current_user.id != @review_comment.user.id
      flash[:notice]="権限がありません"
      redirect_to reviews_path
    end
  end
end
