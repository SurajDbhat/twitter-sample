class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy, :like, :dislike]
  before_action :set_post

  def new
    @comment = @post.comments.build
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = "Your comment has been created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "Your comment has been updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Your comment has been deleted"
    redirect_to post_path(@post.id)
  end

  def like
    @comment.liked_by current_user
    redirect_to post_path(@post.id)
  end

  def dislike
    @comment.disliked_by current_user
    redirect_to post_path(@post.id)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :content, :post_id)
  end

end
