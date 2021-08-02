class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all
    @blogs = @blogs.order(created_at: :desc)
    @blogs = @blogs.page(params[:page]).per(10)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def show
    @bookmark = current_user.bookmarks.find_by(blog_id: @blog.id)
    @blog_comments = @blog.blog_comments.order(created_at: :desc)
    @blog_comment = @blog.blog_comments.build
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:content, :user_id, images: [])
  end

end
