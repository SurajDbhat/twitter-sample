class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :dislike, :publish]

  def index
    @posts = Post.where(status: :published).reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated successfully'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted successfully'
    redirect_to '/'
  end

  def like
    @post.liked_by current_user
    redirect_to post_path(@post)
  end

  def dislike
    @post.disliked_by current_user
    redirect_to post_path(@post)
  end

  def publish
    @post.published!
    flash[:success] = 'Post has been published!'
    redirect_to post_path(@post)
  end

  def draft
    @draft_posts = Post.where(status: :draft, user_id: current_user.id).reverse
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :content)
  end
end
