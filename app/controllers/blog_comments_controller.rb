class BlogCommentsController < ApplicationController
  before_action :ensure_current_user, only: %i[ edit update destroy ]

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.build(blog_comment_params)
    @blog_comment.user_id = current_user.id
    respond_to do |format|
      if @blog_comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.find(params[:id])
    @blog_comment.user_id = current_user.id
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.find(params[:id])
    @blog_comment.user_id = current_user.id
      respond_to do |format|
        if @blog_comment.update(blog_comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @blog_comment = BlogComment.find(params[:id])
    @blog_comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:blog_id, :user_id, :content)
  end

  def ensure_current_user
    if @current_user.id != @blog_comment.user.id
      flash[:notice]="権限がありません"
      redirect_to tasks_path
    end
  end
end
