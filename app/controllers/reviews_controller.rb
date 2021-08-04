class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update edit destroy]
  def index
    @reviews = Review.all
    @reviews = @reviews.order(created_at: :desc)
    @reviews = @reviews.page(params[:page]).per(10)
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if params[:back]
      render :new
    else
      if @review.save
        redirect_to reviews_path, notice: "口コミを作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @like = current_user.likes.find_by(review_id: @review.id)
    @review_comments = @review.review_comments.order(created_at: :desc)
    @review_comment = @review.review_comments.build
  end

  def update
    if @reviews.update(review_params)
      redirect_to reviews_path, notice: "口コミを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "口コミを削除しました！"
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:reservation_at, :quote_price, :orthodontics_type, :content, :star, :user_id, :clinic_id, images: [])
  end

end
