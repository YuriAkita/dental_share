class BookmarksController < ApplicationController
  before_action :authenticate_user!, expect: %i[index]
  before_action :set_blog, only: %i[create destroy]

  def create
    @bookmark = Bookmark.create(user_id: current_user.id, blog_id: params[:blog_id])
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, blog_id: params[:blog_id])
    bookmark.destroy
  end

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end

  private
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
