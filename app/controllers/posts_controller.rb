class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
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

  def edit
    @post = Post.friendly.find params[:title]
    render :new
  end

  def update
    @post = Post.friendly.find params[:title]
    if @post.update post_params
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @post = Post.friendly.find params[:title]
    redirect_to :posts if @post.delete
  end

  private
  def post_params
    params.require(:post).permit :title, :author, :content
  end
end
