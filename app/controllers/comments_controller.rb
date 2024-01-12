class CommentsController < ApplicationController
  before_action :set_blog

  def create
    @comment = @blog.comments.build(comment_params)
    respond_to do |format|

      if @comment.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :index }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :blog_id)
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
