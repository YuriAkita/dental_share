class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :ensure_current_user, only: %i[edit update destroy]

  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true).page(params[:page]).per(10)
    @blogs = @blogs.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    elsif @blog.save
      redirect_to blogs_path, notice: 'ブログを作成しました！'
    else
      render :new
    end
  end

  def edit; end

  def show
    @bookmark = current_user.bookmarks.find_by(blog_id: @blog.id)
    @blog_comments = @blog.blog_comments.order(created_at: :desc)
    @blog_comment = @blog.blog_comments.build
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログを編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました！'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:content, :user_id, images: [])
  end

  def ensure_current_user
    @blog = Blog.find(params[:id])
    if current_user.id != @blog.user.id
      flash[:notice] = '権限がありません'
      redirect_to blogs_path
    end
  end
end
