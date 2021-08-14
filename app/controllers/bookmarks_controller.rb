class BookmarksController < ApplicationController
  before_action :authenticate_user!, expect: %i[index]
  def create
    bookmark = current_user.bookmarks.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{bookmark.blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to blogs_path, notice: "#{bookmark.blog.user.name}さんのブログをお気に入り解除しました"
  end

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end
end
