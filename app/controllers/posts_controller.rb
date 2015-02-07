class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.friendly.find params[:title]
  end

  private
  def post_params
    params.require(:post).permit :title, :author, :content
  end
end
