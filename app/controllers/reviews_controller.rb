class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[show update edit destroy]
  def index
    @q = Review.ransack(params[:q])
    @reviews = Review.all.includes(:user)
    @reviews = @q.result(distinct: true).page(params[:page]).per(6)
    @reviews = @reviews.order(created_at: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if params[:back]
      render :new
    elsif @review.save
      redirect_to reviews_path, notice: '口コミを作成しました！'
    else
      render :new
    end
  end

  def show
    @like = current_user.likes.find_by(review_id: @review.id)
    @review_comments = @review.review_comments.order(created_at: :desc)
    @review_comment = @review.review_comments.build
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to reviews_path, notice: '口コミを編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: '口コミを削除しました！'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:reservation_at, :quote_price, :orthodontics_type, :content, :star, :user_id,
                                   :clinic_id, images: [])
  end
end
