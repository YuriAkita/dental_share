class BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.build(blog_comment_params)
    @blog_comment.user_id = current_user.id
    respond_to do |format|
      if @blog_comment.save
        format.html { redirect_to blog_path(@blog) }
      else
        format.html { redirect_to blog_path(@blog), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:blog_id, :user_id, :content)
  end
end
